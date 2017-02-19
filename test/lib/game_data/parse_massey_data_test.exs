defmodule ParseMasseyDataTest do
  use ExUnit.Case
  import TheSpread.ExampleRequest
  alias TheSpread.ParseMasseyData

  # test "bundle_games returns list of Game maps" do
  #   html = TheSpread.HTML.fetch("http://www.masseyratings.com/cb/11590/games?dt=20170210")
  #   list = ParseMasseyData.bundle_games(html, "ncaa_basketball", "2017-02-10")
  #   assert bundle_games_returns == list
  # end
  @tag :skip
  test "all variable are set and returned in map for game_1" do
    game = massey_game_1
    sport = "ncaa_basketball"
    date = "2017-02-02"
    assert ParseMasseyData.set_variables(game, sport, date) ==  massey_game_1_returns
  end

  @tag :skip
  test "all variable are set and returned in map for game_2" do
    game = massey_game_2
    sport = "ncaa_basketball"
    date = "2017-02-02"
    assert ParseMasseyData.set_variables(game, sport, date) == massey_game_2_returns
  end

  @tag :skip
  test "all variable are set and returned in map for game_3" do
    game = massey_game_3
    sport = "ncaa_basketball"
    date = "2017-02-02"
    assert ParseMasseyData.set_variables(game, sport, date) == massey_game_3_returns
  end

  @tag :skip
  test "all variable are set and returned in map for game_4" do
    game = massey_game_4
    sport = "ncaa_basketball"
    date = "2017-02-02"
    assert ParseMasseyData.set_variables(game, sport, date) == massey_game_4_returns
  end

  test "return home team name" do
    game = massey_game_1
    home_team_name = ParseMasseyData.home_team_name(game)
    assert home_team_name == massey_game_1_returns.home_team_name
  end

  test "return away team name" do
    game = massey_game_1

    away_team_name = ParseMasseyData.away_team_name(game)
    assert away_team_name == massey_game_1_returns.away_team_name
  end

  test "return home team name game 2" do
    game = massey_game_2
    home_team_name = ParseMasseyData.home_team_name(game)
    assert home_team_name == massey_game_2_returns.home_team_name
  end

  test "return away team name game 2" do
    game = massey_game_2

    away_team_name = ParseMasseyData.away_team_name(game)
    assert away_team_name == massey_game_2_returns.away_team_name
  end

  test "return home_team_massey_line 1" do
    game = massey_game_1
    home_team_massey_line = ParseMasseyData.home_team_massey_line(game)
    assert home_team_massey_line == massey_game_1_returns.home_team_massey_line
  end

  test "return away_team_massey_line 1" do
    game = massey_game_1
    away_team_massey_line = ParseMasseyData.away_team_massey_line(game)
    assert away_team_massey_line == massey_game_1_returns.away_team_massey_line
  end

  test "return home_team_massey_line 2" do
    game = massey_game_2
    home_team_massey_line = ParseMasseyData.home_team_massey_line(game)
    assert home_team_massey_line == massey_game_2_returns.home_team_massey_line
  end

  test "return away_team_massey_line 2" do
    game = massey_game_2
    away_team_massey_line = ParseMasseyData.away_team_massey_line(game)
    assert away_team_massey_line == massey_game_2_returns.away_team_massey_line
  end
  test "return home_team_massey_line 3" do
    game = massey_game_3
    home_team_massey_line = ParseMasseyData.home_team_massey_line(game)
    assert home_team_massey_line == massey_game_3_returns.home_team_massey_line
  end

  test "return away_team_massey_line 3" do
    game = massey_game_3
    away_team_massey_line = ParseMasseyData.away_team_massey_line(game)
    assert away_team_massey_line == massey_game_3_returns.away_team_massey_line
  end
  test "return home_team_massey_line 4" do
    game = massey_game_4
    home_team_massey_line = ParseMasseyData.home_team_massey_line(game)
    assert home_team_massey_line == massey_game_4_returns.home_team_massey_line
  end

  test "return away_team_massey_line 4" do
    game = massey_game_4
    away_team_massey_line = ParseMasseyData.away_team_massey_line(game)
    assert away_team_massey_line == massey_game_4_returns.away_team_massey_line
  end

  test "return massey_over_under" do
    game = massey_game_1
    massey_over_under = ParseMasseyData.massey_over_under(game)
    assert massey_over_under == massey_game_1_returns.massey_over_under
  end

  test "return home_team_final_score game 1" do
    game = massey_game_1
    home_team_final_score = ParseMasseyData.home_team_final_score(game)
    assert home_team_final_score == massey_game_1_returns.home_team_final_score
  end

  test "return away_team_final_score game 1" do
    game = massey_game_1
    away_team_final_score = ParseMasseyData.away_team_final_score(game)
    assert away_team_final_score == massey_game_1_returns.away_team_final_score
  end

  test "return home_team_final_score game 2" do
    game = massey_game_2
    home_team_final_score = ParseMasseyData.home_team_final_score(game)
    assert home_team_final_score == massey_game_2_returns.home_team_final_score
  end

  test "return away_team_final_score game 2" do
    game = massey_game_2
    away_team_final_score = ParseMasseyData.away_team_final_score(game)
    assert away_team_final_score == massey_game_2_returns.away_team_final_score
  end

  test "return home_team_final_score game 3" do
    game = massey_game_3
    home_team_final_score = ParseMasseyData.home_team_final_score(game)
    assert home_team_final_score == massey_game_3_returns.home_team_final_score
  end

  test "return away_team_final_score game 3" do
    game = massey_game_3
    away_team_final_score = ParseMasseyData.away_team_final_score(game)
    assert away_team_final_score == massey_game_3_returns.away_team_final_score
  end

  test "return home_team_final_score game 4" do
    game = massey_game_4
    home_team_final_score = ParseMasseyData.home_team_final_score(game)
    assert home_team_final_score == massey_game_4_returns.home_team_final_score
  end

  test "return away_team_final_score game 4" do
    game = massey_game_4
    away_team_final_score = ParseMasseyData.away_team_final_score(game)
    assert away_team_final_score == massey_game_4_returns.away_team_final_score
  end
  #
  # test "gets data when game has not been played" do
  #   game = massey_game__game_not_over
  #   sport = "ncaa_basketball"
  #   date = "2017-02-02"
  #   assert ParseMasseyData.set_variables(game_, sport, date) == massey_game_not_over_returns
  # end

  def massey_game_1_returns do
    %{
      home_team_name:  "citadel",
      away_team_name: "wofford",
      home_team_massey_line: 4.5,
      away_team_massey_line: -4.5,
      massey_over_under: 190.5,
      game_over: true,
      sport: "ncaa_basketball",
      date: ~D[2017-02-02],
      home_team_final_score: 90,
      away_team_final_score: 100
    }
  end

  def massey_game_2_returns do
    %{
      home_team_name:  "idaho",
      away_team_name: "portland st",
      home_team_massey_line: -3.5,
      away_team_massey_line: 3.5,
      massey_over_under: 152.5,
      game_over: true,
      sport: "ncaa_basketball",
      date: ~D[2017-02-02],
      home_team_final_score: 89,
      away_team_final_score: 72
    }
  end

  def massey_game_3_returns do
    %{
      home_team_name:  "st francis ny",
      away_team_name: "st francis pa",
      home_team_massey_line: 6.5,
      away_team_massey_line: -6.5,
      massey_over_under: 142.5,
      game_over: true,
      sport: "ncaa_basketball",
      date: ~D[2017-02-02],
      home_team_final_score: 61,
      away_team_final_score: 78
    }
  end

  def massey_game_4_returns do
    %{
      home_team_name:  "cleveland st",
      away_team_name: "detroit",
      home_team_massey_line: -6.5,
      away_team_massey_line:  6.5,
      massey_over_under: 150.5,
      game_over: true,
      sport: "ncaa_basketball",
      date: ~D[2017-02-02],
      home_team_final_score: 90,
      away_team_final_score: 73
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
      date: ~D[2017-02-02]
    }
  end

  def bundle_games_returns do
    [
      %{away_team_name: "dayton", date: ~D[2017-02-02], game_over: true, home_team_name: "rhode island", massey_over_under: 135.5, sport: "ncaa_basketball", away_team_massey_line: 0.5, home_team_massey_line: -0.5}, %{away_team_massey_line: -8.5, away_team_name: "oakland", date: ~D[2017-02-02], game_over: true, home_team_massey_line: 8.5, home_team_name: "detroit", massey_over_under: 161.5, sport: "ncaa_basketball"}, %{away_team_name: "dartmouth", date: ~D[2017-02-10], game_over: true, home_team_name: "yale", massey_over_under: 140.5, sport: "ncaa_basketball", away_team_massey_line: 17.5, home_team_massey_line: -17.5}, %{away_team_name: "cornell", date: ~D[2017-02-10], game_over: true, home_team_name: "princeton", sport: "ncaa_basketball", away_team_massey_line: 13.5, home_team_massey_line: -13.5, massey_over_under: 141.5}, %{away_team_name: "columbia", date: ~D[2017-02-10], game_over: true, home_team_name: "penn", sport: "ncaa_basketball", away_team_massey_line: 3.5, home_team_massey_line: -3.5, massey_over_under: 140.5}, %{away_team_name: "harvard", date: ~D[2017-02-10], game_over: true, home_team_name: "bgame_n", massey_over_under: 147.5, sport: "ncaa_basketball", away_team_massey_line: -3.5, home_team_massey_line: 3.5}, %{away_team_name: "niagara", date: ~D[2017-02-10], game_over: true, home_team_name: "canisius", massey_over_under: 161.5, sport: "ncaa_basketball", away_team_massey_line: 9.5, home_team_massey_line: -9.5}, %{away_team_massey_line: -10.5, away_team_name: "monmouth nj", date: ~D[2017-02-10], game_over: true, home_team_massey_line: 10.5, home_team_name: "manhattan", massey_over_under: 153.5, sport: "ncaa_basketball"}
     ]
  end
end
