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
      |> String.split("vs.")
      |> List.first
      |> String.trim
  end
end
