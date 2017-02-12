defmodule ParseWunderDataTest do
  import TheSpread.ExampleRequest
  use ExUnit.Case
  alias TheSpread.ParseWunderData

  test "return away team name" do
    row = wunder_row1
    home_team_name = ParseWunderData.away_team_name(row)
    assert home_team_name == "Ohio Bobcats"
  end

  test  "returns home_team_bet_count" do
    row = wunder_row1
    home_team_bet_count = ParseWunderData.home_team_bet_count(row)
    assert home_team_bet_count == 476
  end

  test  "returns away_team_bet_count" do
    row = wunder_row1
    away_team_bet_count = ParseWunderData.away_team_bet_count(row)
    assert away_team_bet_count == 465
  end

  test "return home team name" do
    row = wunder_row1
    home_team_name = ParseWunderData.home_team_name(row)
    assert home_team_name == "Ball State Cardinals"
  end

  test "get odds url" do
    row = wunder_row1
    url = ParseWunderData.get_odds_url(row)
    assert url == "http://www.wunderdog.com/consensus/viewScoreOdds/event_id/429862.html?width=610"
  end

  test "return home_team_vegas_line" do
    row = wunder_row1
    home_team_vegas_line = ParseWunderData.home_team_vegas_line(row)
    assert home_team_vegas_line == -1.5
  end

  test "return away_team_vegas_line" do
    row = wunder_row1
    away_team_vegas_line = ParseWunderData.away_team_vegas_line(row)
    assert away_team_vegas_line == 1.5
  end

  test "return over under" do
    row = wunder_row1
    vegas_over_under = ParseWunderData.vegas_over_under(row)
    assert vegas_over_under == 153.5
  end
end
