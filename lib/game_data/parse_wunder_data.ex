defmodule TheSpread.ParseWunderData do
  @moduledoc """
    TODO: Rename to PrepareWunderData
    Provides a function `bundle_games/3` which returns a list of Game maps.

    Several methods are left public in here that should not be used by other
    modules but needed to be tested(Needs to be fixed).

    FIX: Need to improve how I handle errors when parsing unexpected HTML
  """

  @doc """
    Returns a list of Game maps with wunder data.

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
      away_team_bet_count: away_team_bet_count(row),
      home_team_final_score: home_team_final_score(row),
      away_team_final_score: away_team_final_score(row)

    }
  end

  def table(html) do
    Floki.find(html, "table.table.table-bordered.table-condensed tbody tr") |> Enum.drop(3) |> Enum.chunk(2)
  end

  def home_team_name(row) do
    name =
      Floki.find(row, ".jTip")
        |> Floki.attribute("name")
        |> List.first
    if String.contains?(name, "vs.") do
      name
        |> String.split("vs.")
        |> List.last
        |> String.split("-")
        |> List.first
        |> String.trim
        |> String.downcase
    else
      name
        |> String.split("@")
        |> List.last
        |> String.split("-")
        |> List.first
        |> String.trim
        |> String.downcase
    end
  end

  def away_team_name(row) do
    name =
      Floki.find(row, ".jTip")
        |> Floki.attribute("name")
        |> List.first
    if String.contains?(name, "vs.") do
      name
        |> String.split("vs.")
        |> List.first
        |> String.trim
        |> String.downcase
    else
      name
        |> String.split("@")
        |> List.first
        |> String.trim
        |> String.downcase
    end
  end

  def home_team_vegas_line(row) do
    [_, home, _] = get_odds_table(row)
    line = Floki.text(home)
      |> String.split(" ")
      |> List.first
      |> String.split("(")
      |> List.first
      try do
        line
          |> String.trim
          |> String.to_float
      rescue
        _ -> nil
        # _ ->
        #   {_, _, percent} = line
        #   List.to_string(percent)
      end
  end

  def away_team_vegas_line(row) do
    [_, _, away] = get_odds_table(row)
    try do
    Floki.text(away)
      |> String.split(" ")
      |> List.first
      |> String.split("(")
      |> List.first
      |> String.trim
      |> String.to_float
    rescue
      _ -> nil
      # FunctionClauseError ->
      #   line = Floki.text(away)
      #     |> String.split(" ")
      #     |> List.first
      #     |> String.split("(")
      #     |> List.first
      #   {_, _, percent} = line
      #   List.to_string(percent)
    end
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
    try do
      percent |> List.first |> String.trim |> String.strip(?%) |> String.to_integer
    rescue
       FunctionClauseError ->
        percent = percent |> List.first
        {_, _, percent} = percent
        List.to_string(percent) |> String.strip(?%) |> String.to_integer
    end
  end

  def over_percent(row) do
    [over | [ _ | _ ] ] = over_under_percent_data(row)
    {_, _, percent} = over
    try do
      percent |> List.first |> String.trim |> String.strip(?%) |> String.to_integer
    rescue
       FunctionClauseError ->
        percent = percent |> List.first
        {_, _, percent} = percent
        List.to_string(percent) |> String.strip(?%) |> String.to_integer
    end
  end

  def home_team_spread_percent(row) do
    [_| [ home | _ ] ] = spread_percent_data(row)
    {_, _, percent} = home
    try do
      percent |> List.first |> String.trim |> String.strip(?%) |> String.to_integer
    rescue
      FunctionClauseError ->
        line = percent |> List.first
        {_, _, percent} = line
        List.to_string(percent) |> String.strip(?%) |> String.to_integer
    end
  end

  def away_team_spread_percent(row) do
    [away | [ _ | _ ] ] = spread_percent_data(row)
    {_, _, percent} = away
    try do
      percent |> List.first |> String.trim |> String.strip(?%) |> String.to_integer
    rescue
      FunctionClauseError ->
        line = percent |> List.first
        {_, _, percent} = line
        List.to_string(percent) |> String.strip(?%) |> String.to_integer
    end
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
    address = Floki.find(row, "a:nth-child(1)") |> Floki.attribute("href") |> List.first
    "http://www.wunderdog.com#{address}"
  end

  def get_odds_table(row) do
    odds_table = get_odds_url(row)
      |> TheSpread.HTML.fetch
      |> Floki.find("table span.checkmark")
      |> Enum.drop(15)
    case odds_table do
      [] ->
        odds_table = get_odds_url(row)
          |> TheSpread.HTML.fetch
          |> Floki.find("table span")
          |> Enum.drop(15)
      _else ->
        odds_table
    end
  end

  def home_team_final_score(row) do
    try do
      odds_table = get_odds_url(row)
         |> TheSpread.HTML.fetch
         |> Floki.find("tbody tr td")
         |> Enum.take(18)
         |> Enum.drop(17)
         |> Floki.text
         |> String.to_integer
    rescue
      FunctionClauseError -> nil
    end
  end

  def away_team_final_score(row) do
    try do
      odds_table = get_odds_url(row)
        |> TheSpread.HTML.fetch
        |> Floki.find("tbody tr td")
        |> Enum.take(13)
        |> Enum.drop(12)
        |> Floki.text
        |> String.to_integer
    rescue
      FunctionClauseError -> nil
    end
  end

  def format_date(date) do
    {_, date} = Date.from_iso8601(date)
    date
  end
end
