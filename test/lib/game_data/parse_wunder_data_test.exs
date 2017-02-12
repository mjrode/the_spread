defmodule ParseWunderDataTest do
  import TheSpread.ExampleRequest
  use ExUnit.Case
  alias TheSpread.ParseWunderData

  test "return home team name" do
    row = wunder_row_1
    home_team_name = ParseWunderData.home_team_name(row)
    assert home_team_name == "Ball State Cardinals"
  end
end
