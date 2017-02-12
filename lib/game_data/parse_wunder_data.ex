defmodule TheSpread.ParseWunderData do
  @moduledoc """
    Provides a function `bundle_games/3` which returns a list of Game maps.

    Several methods are left public in here that should not be used by other
    modules but needed to be tested(Needs to be fixed).
  """

  @doc """
    Returns a list of Game maps with massey data.

    ##Parameters
      - sport: String that represents the sport you want massey_data for
      - date: String in the form of "yyyy-mm-dd" that represents the date of the game
      - html: The html that is returned by calling
        ConstructURL.massey(sport, date)
          |> HTML.fetch
  """

  def bundle_games(html, sport, date) do
    table = table(html)
    for row <- table, do: set_variables(row, sport, date)
  end

  # Left public for testing
  def set_variables(row, sport, date) do
    %{
      date: format_date(date),
      sport: sport,
      home_team_name: home_team_name(row),
      away_team_name: away_team_name(row),
      home_team_vegas_line: home_team_vegas_line(row),
      away_team_vegas_line: away_team_vegas_line(row),
      vegas_over_under: vegas_over_under(row),
      home_team_spread_percent: home_team_spread_percent(row),
      away_team_spread_percent: away_team_spread_percent(row),
      under_percent: under_percent(row),
      over_percent: over_percent(row),
      home_team_bet_count: home_team_bet_count(row),
      away_team_bet_count: away_team_bet_count(row)
    }
  end

  def table(html) do
    Floki.find(html, "table.table.table-bordered.table-condensed tbody tr") |> Enum.drop(3) |> Enum.chunk(3)
  end

  def home_team_name(row) do
    Floki.find(row, ".jTip")
      |> Floki.attribute("name")
      |> List.first
      |> String.split("vs.")
      |> List.last
      |> String.split("-")
      |> List.first
      |> String.trim
  end

  def away_team_name(row) do
    Floki.find(row, ".jTip")
      |> Floki.attribute("name")
      |> List.first
      |> String.split("vs.")
      |> List.first
      |> String.trim
  end

  def home_team_vegas_line(row) do
    [_, home, _] = get_odds_table(row)
    Floki.text(home)
      |> String.split(" ")
      |> List.first
      |> String.split("(")
      |> List.first
      |> String.trim
      |> String.to_float
  end

  def away_team_vegas_line(row) do
    [_, _, away] = get_odds_table(row)
    Floki.text(away)
      |> String.split(" ")
      |> List.first
      |> String.split("(")
      |> List.first
      |> String.trim
      |> String.to_float
  end

  def vegas_over_under(row) do
    [over, _, _] = get_odds_table(row)
    Floki.text(over)
      |> String.split(" ")
      |> List.first
      |> String.split("O")
      |> List.last
      |> String.trim
      |> String.to_float
  end

  def bet_count_data(row) do
    List.flatten(row)
      |> Floki.find("td:nth-child(4)")
  end

  def spread_percent_data(row) do
    row
      |> List.flatten
      |> Floki.find("td:nth-child(5)")
  end

  def over_under_percent_data(row) do
    row
      |> List.flatten
      |> Floki.find("td:nth-child(11)")
  end

  def under_percent(row) do
    [_ | [ under | _ ] ] = over_under_percent_data(row)
    {_, _, percent} = under
    percent |> List.first |> String.trim
  end

  def over_percent(row) do
    [over | [ _ | _ ] ] = over_under_percent_data(row)
    {_, _, percent} = over
    [{_, _, percent}] = percent
    percent |> List.first |> String.trim
  end

  def home_team_spread_percent(row) do
    [_| [ home | _ ] ] = spread_percent_data(row)
    {_, _, percent} = home
    percent |> List.first |> String.trim
  end

  def away_team_spread_percent(row) do
    [away | [ _ | _ ] ] = spread_percent_data(row)
    {_, _, percent} = away
    percent |> List.first |> String.trim
  end

  def home_team_bet_count(row) do
    [ _ | [home | _ ]] = bet_count_data(row)
    Floki.text(home) |> String.trim |> String.to_integer
  end

  def away_team_bet_count(row) do
    [ away | [ _ | _ ]] = bet_count_data(row)
    Floki.text(away) |> String.trim |> String.to_integer
  end

  def get_odds_url(row) do
    address = Floki.find(row, "a:nth-child(1)")
      |> Floki.attribute("href")
      |> List.first
    "http://www.wunderdog.com#{address}"
  end

  def get_odds_table(row) do
    get_odds_url(row)
      |> TheSpread.HTML.fetch
      |> Floki.find("table span.checkmark")
      |> Enum.drop(15)
  end

  def format_date(date) do
    {_, date} = Date.from_iso8601(date)
    date
  end
end
