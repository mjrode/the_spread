defmodule ParseWunderDataTest do
  import TheSpread.ExampleRequest
  use ExUnit.Case
  alias TheSpread.ParseWunderData

  test "set_variables fetches and sets all the proper data" do
    row = wunder_row1
    set_variables = ParseWunderData.set_variables(row, "ncaa_basketball", "2017-02-10")
    assert set_variables == set_variables_return
  end
  test "return home_team_spread_percent" do
    row = wunder_row1
    home_team_spread_percent = ParseWunderData.home_team_spread_percent(row)
    assert home_team_spread_percent  == "51%"
  end

  test "return over_percent" do
    row = wunder_row1
    over_percent = ParseWunderData.over_percent(row)
    assert over_percent  == "67%"
  end

  test "return under_percent" do
    row = wunder_row1
    under_percent = ParseWunderData.under_percent(row)
    assert under_percent  == "33%"
  end

  test "return away_team_spread_percent" do
    row = wunder_row1
    away_team_spread_percent = ParseWunderData.away_team_spread_percent(row)
    assert away_team_spread_percent == "49%"
  end

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

  def set_variables_return do
    %{away_team_bet_count: 465, away_team_name: "Ohio Bobcats",
  away_team_spread_percent: "49%", away_team_vegas_line: 1.5,
  date: ~D[2017-02-10], home_team_bet_count: 476,
  home_team_name: "Ball State Cardinals", home_team_spread_percent: "51%",
  home_team_vegas_line: -1.5, over_percent: "67%", sport: "ncaa_basketball",
  under_percent: "33%", vegas_over_under: 153.5}
  end
end
