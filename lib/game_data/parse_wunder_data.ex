defmodule TheSpread.ParseWunderData do

  def table(html) do
    Floki.find(html, "table.table.table-bordered.table-condensed tbody tr") |> Enum.drop(3)
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
  #  Floki.find(bad, ".jTip") ; returns [] for bad data
end
