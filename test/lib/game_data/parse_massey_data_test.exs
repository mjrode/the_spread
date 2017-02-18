defmodule ParseMasseyDataTest do
  use ExUnit.Case
  import TheSpread.ExampleRequest
  alias TheSpread.ParseMasseyData

  test "bundle_games returns list of Game maps" do
    html = TheSpread.HTML.fetch("http://www.masseyratings.com/cb/11590/games?dt=20170210")
    list = ParseMasseyData.bundle_games(html, "ncaa_basketball", "2017-02-10")
    assert bundle_games_returns == list
  end

  test "all variable are set and returned in map for row1" do
    row = massey_row1
    sport = "ncaa_basketball"
    date = "2017-02-10"
    assert ParseMasseyData.set_variables(row, sport, date) ==  massey_row1_returns
  end

  test "all variable are set and returned in map for row2" do
    row = massey_row2
    sport = "ncaa_basketball"
    date = "2017-02-10"
    assert ParseMasseyData.set_variables(row, sport, date) == massey_row2_returns
  end

  test "all variable are set and returned in map for row3" do
    row = massey_row3
    sport = "ncaa_basketball"
    date = "2017-02-10"
    assert ParseMasseyData.set_variables(row, sport, date) == massey_row3_returns
  end

  test "all variable are set and returned in map for row4" do
    row = massey_row4
    sport = "ncaa_basketball"
    date = "2017-02-10"
    assert ParseMasseyData.set_variables(row, sport, date) == massey_row4_returns
  end

  test "return home team name" do
    row = massey_row1
    home_team_name = ParseMasseyData.home_team_name(row)
    assert home_team_name == massey_row1_returns.home_team_name
  end

  test "return away team name" do
    row = massey_row1

    away_team_name = ParseMasseyData.away_team_name(row)
    assert away_team_name == massey_row1_returns.away_team_name
  end

  test "return home_team_massey_line" do
    row = massey_row1
    home_team_massey_line = ParseMasseyData.home_team_massey_line(row)
    assert home_team_massey_line == massey_row1_returns.home_team_massey_line
  end

  test "return away_team_massey_line" do
    row = massey_row1
    away_team_massey_line = ParseMasseyData.away_team_massey_line(row)
    assert away_team_massey_line == massey_row1_returns.away_team_massey_line
  end

  test "return massey_over_under" do
    row = massey_row1
    massey_over_under = ParseMasseyData.massey_over_under(row)
    assert massey_over_under == massey_row1_returns.massey_over_under
  end

  test "gets data when game has not been played" do
    row = massey_row_game_not_over
    sport = "ncaa_basketball"
    date = "2017-02-10"
    assert ParseMasseyData.set_variables(row, sport, date) == massey_game_not_over_returns
  end

  def massey_row1_returns do
    %{
      home_team_name:  "rhode island",
      away_team_name: "dayton",
      home_team_massey_line: -1.5,
      away_team_massey_line: 1.5,
      massey_over_under: 135.5,
      game_over: true,
      sport: "ncaa_basketball",
      date: ~D[2017-02-10]
    }
  end

  def massey_row2_returns do
    %{
      home_team_name:  "detroit",
      away_team_name: "oakland",
      home_team_massey_line: 8.5,
      away_team_massey_line: -8.5,
      massey_over_under: 161.5,
      game_over: true,
      sport: "ncaa_basketball",
      date: ~D[2017-02-10]
    }
  end

  def massey_row3_returns do
    %{
      home_team_name:  "yale",
      away_team_name: "dartmouth",
      home_team_massey_line: -16.5,
      away_team_massey_line: 16.5,
      massey_over_under: 140.5,
      game_over: true,
      sport: "ncaa_basketball",
      date: ~D[2017-02-10]
    }
  end

  def massey_row4_returns do
    %{
      home_team_name:  "princeton",
      away_team_name: "cornell",
      home_team_massey_line: -14.5,
      away_team_massey_line: 14.5,
      massey_over_under: 139.5,
      game_over: true,
      sport: "ncaa_basketball",
      date: ~D[2017-02-10]
    }
  end

  def massey_game_not_over_returns do
    %{
      home_team_name:  "appalachian st",
      away_team_name: "ga southern",
      home_team_massey_line: 4.5,
      away_team_massey_line: -4.5,
      massey_over_under: 153.5,
      game_over: false,
      sport: "ncaa_basketball",
      date: ~D[2017-02-10]
    }
  end

  def bundle_games_returns do
    [
      %{away_team_name: "dayton", date: ~D[2017-02-10], game_over: true, home_team_name: "rhode island", massey_over_under: 135.5, sport: "ncaa_basketball", away_team_massey_line: 0.5, home_team_massey_line: -0.5}, %{away_team_massey_line: -8.5, away_team_name: "oakland", date: ~D[2017-02-10], game_over: true, home_team_massey_line: 8.5, home_team_name: "detroit", massey_over_under: 161.5, sport: "ncaa_basketball"}, %{away_team_name: "dartmouth", date: ~D[2017-02-10], game_over: true, home_team_name: "yale", massey_over_under: 140.5, sport: "ncaa_basketball", away_team_massey_line: 17.5, home_team_massey_line: -17.5}, %{away_team_name: "cornell", date: ~D[2017-02-10], game_over: true, home_team_name: "princeton", sport: "ncaa_basketball", away_team_massey_line: 13.5, home_team_massey_line: -13.5, massey_over_under: 141.5}, %{away_team_name: "columbia", date: ~D[2017-02-10], game_over: true, home_team_name: "penn", sport: "ncaa_basketball", away_team_massey_line: 3.5, home_team_massey_line: -3.5, massey_over_under: 140.5}, %{away_team_name: "harvard", date: ~D[2017-02-10], game_over: true, home_team_name: "brown", massey_over_under: 147.5, sport: "ncaa_basketball", away_team_massey_line: -3.5, home_team_massey_line: 3.5}, %{away_team_name: "niagara", date: ~D[2017-02-10], game_over: true, home_team_name: "canisius", massey_over_under: 161.5, sport: "ncaa_basketball", away_team_massey_line: 9.5, home_team_massey_line: -9.5}, %{away_team_massey_line: -10.5, away_team_name: "monmouth nj", date: ~D[2017-02-10], game_over: true, home_team_massey_line: 10.5, home_team_name: "manhattan", massey_over_under: 153.5, sport: "ncaa_basketball"}
     ]
  end
end
