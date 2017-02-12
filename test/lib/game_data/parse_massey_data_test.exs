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
      home_team_name:  "@ Rhode Island",
      away_team_name: "Dayton",
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
      home_team_name:  "@ Detroit",
      away_team_name: "Oakland",
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
      home_team_name:  "@ Yale",
      away_team_name: "Dartmouth",
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
      home_team_name:  "@ Princeton",
      away_team_name: "Cornell",
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
      home_team_name:  "@ Appalachian St",
      away_team_name: "Ga Southern",
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
      %{away_team_massey_line: 1.5, away_team_name: "Dayton", date: ~D[2017-02-10],
       game_over: true, home_team_massey_line: -1.5,
       home_team_name: "@ Rhode Island", massey_over_under: 135.5,
       sport: "ncaa_basketball"},
     %{away_team_massey_line: -8.5, away_team_name: "Oakland", date: ~D[2017-02-10],
       game_over: true, home_team_massey_line: 8.5, home_team_name: "@ Detroit",
       massey_over_under: 161.5, sport: "ncaa_basketball"},
     %{away_team_massey_line: 16.5, away_team_name: "Dartmouth",
       date: ~D[2017-02-10], game_over: true, home_team_massey_line: -16.5,
       home_team_name: "@ Yale", massey_over_under: 140.5,
       sport: "ncaa_basketball"},
     %{away_team_massey_line: 14.5, away_team_name: "Cornell", date: ~D[2017-02-10],
       game_over: true, home_team_massey_line: -14.5, home_team_name: "@ Princeton",
       massey_over_under: 139.5, sport: "ncaa_basketball"},
     %{away_team_massey_line: 2.5, away_team_name: "Columbia", date: ~D[2017-02-10],
       game_over: true, home_team_massey_line: -2.5, home_team_name: "@ Penn",
       massey_over_under: 139.5, sport: "ncaa_basketball"},
     %{away_team_massey_line: -4.5, away_team_name: "Harvard", date: ~D[2017-02-10],
       game_over: true, home_team_massey_line: 4.5, home_team_name: "@ Brown",
       massey_over_under: 147.5, sport: "ncaa_basketball"},
     %{away_team_massey_line: 8.5, away_team_name: "Niagara", date: ~D[2017-02-10],
       game_over: true, home_team_massey_line: -8.5, home_team_name: "@ Canisius",
       massey_over_under: 161.5, sport: "ncaa_basketball"},
     %{away_team_massey_line: -10.5, away_team_name: "Monmouth NJ",
       date: ~D[2017-02-10], game_over: true, home_team_massey_line: 10.5,
       home_team_name: "@ Manhattan", massey_over_under: 153.5,
       sport: "ncaa_basketball"},
     %{away_team_massey_line: -0.5, away_team_name: "Akron", date: ~D[2017-02-10],
       game_over: true, home_team_massey_line: 0.5, home_team_name: "@ E Michigan",
       massey_over_under: 146.5, sport: "ncaa_basketball"},
     %{away_team_massey_line: -1.5, away_team_name: "Ohio", date: ~D[2017-02-10],
       game_over: true, home_team_massey_line: 1.5, home_team_name: "@ Ball St",
       massey_over_under: 149.5, sport: "ncaa_basketball"}
     ]
  end
end
