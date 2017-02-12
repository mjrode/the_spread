defmodule ParseDataTest do
  use ExUnit.Case
  import TheSpread.ExampleRequest
  alias TheSpread.ParseData

  test "all variable are set and returned in map for row1" do
    row = massey_row1
    sport = "ncaa_basketball"
    date = "2017-02-10"
    assert ParseData.set_variables(row, sport, date) ==  massey_row1_returns
  end

  test "all variable are set and returned in map for row2" do
    row = massey_row2
    sport = "ncaa_basketball"
    date = "2017-02-10"
    assert ParseData.set_variables(row, sport, date) == massey_row2_returns
  end

  test "all variable are set and returned in map for row3" do
    row = massey_row3
    sport = "ncaa_basketball"
    date = "2017-02-10"
    assert ParseData.set_variables(row, sport, date) == massey_row3_returns
  end

  test "all variable are set and returned in map for row4" do
    row = massey_row4
    sport = "ncaa_basketball"
    date = "2017-02-10"
    assert ParseData.set_variables(row, sport, date) == massey_row4_returns
  end

  test "return home team name" do
    row = massey_row1
    home_team_name = ParseData.home_team_name(row)
    assert home_team_name == massey_row1_returns.home_team_name
  end

  test "return away team name" do
    row = massey_row1

    away_team_name = ParseData.away_team_name(row)
    assert away_team_name == massey_row1_returns.away_team_name
  end

  test "return home_team_massey_line" do
    row = massey_row1
    home_team_massey_line = ParseData.home_team_massey_line(row)
    assert home_team_massey_line == massey_row1_returns.home_team_massey_line
  end

  test "return away_team_massey_line" do
    row = massey_row1
    away_team_massey_line = ParseData.away_team_massey_line(row)
    assert away_team_massey_line == massey_row1_returns.away_team_massey_line
  end

  test "return massey_over_under" do
    row = massey_row1
    massey_over_under = ParseData.massey_over_under(row)
    assert massey_over_under == massey_row1_returns.massey_over_under
  end

  test "gets data when game has not been played" do
    row = massey_row_game_not_over
    sport = "ncaa_basketball"
    date = "2017-02-10"
    assert ParseData.set_variables(row, sport, date) == massey_game_not_over_returns
  end

  def massey_row1_returns do
    %{
      home_team_name:  "@ Rhode Island",
      away_team_name: "Dayton",
      home_team_massey_line: -1.5,
      away_team_massey_line: 1.5,
      massey_over_under: 135.5,
      game_over: true,
      sport: "ncaa_basketball",
      date: "2017-02-10"
    }
  end

  def massey_row2_returns do
    %{
      home_team_name:  "@ Detroit",
      away_team_name: "Oakland",
      home_team_massey_line: 8.5,
      away_team_massey_line: -8.5,
      massey_over_under: 161.5,
      game_over: true,
      sport: "ncaa_basketball",
      date: "2017-02-10"
    }
  end

  def massey_row3_returns do
    %{
      home_team_name:  "@ Yale",
      away_team_name: "Dartmouth",
      home_team_massey_line: -16.5,
      away_team_massey_line: 16.5,
      massey_over_under: 140.5,
      game_over: true,
      sport: "ncaa_basketball",
      date: "2017-02-10"
    }
  end

  def massey_row4_returns do
    %{
      home_team_name:  "@ Princeton",
      away_team_name: "Cornell",
      home_team_massey_line: -14.5,
      away_team_massey_line: 14.5,
      massey_over_under: 139.5,
      game_over: true,
      sport: "ncaa_basketball",
      date: "2017-02-10"
    }
  end

  def massey_game_not_over_returns do
    %{
      home_team_name:  "@ Appalachian St",
      away_team_name: "Ga Southern",
      home_team_massey_line: 4.5,
      away_team_massey_line: -4.5,
      massey_over_under: 153.5,
      game_over: false,
      sport: "ncaa_basketball",
      date: "2017-02-10",
    }
  end
end
