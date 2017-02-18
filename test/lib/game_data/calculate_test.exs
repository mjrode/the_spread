defmodule CalculateTest do
  use ExUnit.Case
  alias TheSpread.Calculate

  def valid_game1 do
    # http://www.masseyratings.com/cb/11590/games?dt=20170201
    # team_to_bet: "indiana hoosiers"
    # public_percentage_on_massey_team: 66.0

    %TheSpread.Game{
       away_team_bet_count: 405, away_team_final_score: 102,
       away_team_massey_line: 8.5, away_team_name: "penn state nittany lions",
       away_team_spread_percent: 34.0, away_team_vegas_line: 6.0,
       correct_over_under_prediction: false, correct_prediction: false,
       game_over: true, home_team_bet_count: 785,
       home_team_final_score: 110, home_team_massey_line: -8.5,
       home_team_name: "indiana hoosiers", home_team_spread_percent: 66.0,
       home_team_vegas_line: -6.0, id: 722,
       inserted_at: ~N[2017-02-16 02:20:17.022364], line_diff: nil,
       massey_over_under: 148.5, over_percent: 64.0, over_under_diff: nil,
       over_under_pick: nil, public_percentage_on_massey_team: nil,
       sport: "ncaa_basketball", strength: nil, team_to_bet: nil,
       under_percent: 36.0, updated_at: ~N[2017-02-16 02:20:20.939620],
       vegas_over_under: 144.5}
  end

  def valid_game2 do
    # http://www.masseyratings.com/cb/11590/games?dt=20170201
    # team_to_bet:
    # public_percentage_on_massey_team:
    %TheSpread.Game{
     away_team_bet_count: 529, away_team_final_score: 70,
     away_team_massey_line: 6.5, away_team_name: "seton hall pirates",
     away_team_spread_percent: 39.0, away_team_vegas_line: 5.0,
     correct_over_under_prediction: false, correct_prediction: false,
     game_over: true, home_team_bet_count: 844,
     home_team_final_score: 72, home_team_massey_line: -6.5,
     home_team_name: "xavier musketeers", home_team_spread_percent: 61.0,
     home_team_vegas_line: -5.0, id: 742,
     inserted_at: ~N[2017-02-16 02:20:17.233400], line_diff: nil,
     massey_over_under: 145.5, over_percent: 62.0, over_under_diff: nil,
     over_under_pick: nil, public_percentage_on_massey_team: nil,
     sport: "ncaa_basketball", strength: nil, team_to_bet: nil, under_percent: 38.0,
     updated_at: ~N[2017-02-16 02:20:21.151892], vegas_over_under: 144.5}
  end

  def valid_game3 do
    # http://www.masseyratings.com/cb/11590/games?dt=20170201
    # team_to_bet:
    # public_percentage_on_massey_team:
    %TheSpread.Game{
       away_team_bet_count: 270, away_team_final_score: 77,
       away_team_massey_line: -15.5, away_team_name: "wichita state shockers",
       away_team_spread_percent: 70.0, away_team_vegas_line: -16.5,
       correct_over_under_prediction: false, correct_prediction: false,
       game_over: true, home_team_bet_count: 114,
       home_team_final_score: 69, home_team_massey_line: 15.5,
       home_team_name: "drake bulldogs", home_team_spread_percent: 30.0,
       home_team_vegas_line: 16.5, id: 724,
       inserted_at: ~N[2017-02-16 02:20:17.118637], line_diff: nil,
       massey_over_under: 151.5, over_percent: 56.0, over_under_diff: nil,
       over_under_pick: nil, public_percentage_on_massey_team: nil,
       sport: "ncaa_basketball", strength: nil, team_to_bet: nil,
       under_percent: 44.0, updated_at: ~N[2017-02-16 02:20:20.968374],
       vegas_over_under: 147.5}
  end

  def valid_game4 do
    # http://www.masseyratings.com/cb/11590/games?dt=20170202
    # TODO: Something is wrong with how we are grabbing this data.
    # The home team and away team spread percent are off.
    # Should add a check that makes sure home spread perc + away spread perc = 100%

    %TheSpread.Game{
     away_team_bet_count: 520, away_team_final_score: 72,
     away_team_massey_line: 0.5, away_team_name: "michigan state spartans",
     away_team_spread_percent: 73.0, away_team_vegas_line: -1.5,
     correct_over_under_prediction: false, correct_prediction: false,
     game_over: true, home_team_bet_count: 80,
     home_team_final_score: 61, home_team_massey_line: -0.5,
     home_team_name: "nebraska cornhuskers", home_team_spread_percent: 27.0,
     home_team_vegas_line: 1.5, id: 751,
     inserted_at: ~N[2017-02-16 03:06:56.558630], line_diff: nil,
     massey_over_under: 137.5, over_percent: 37.0, over_under_diff: nil,
     over_under_pick: nil, public_percentage_on_massey_team: nil,
     sport: "ncaa_basketball", strength: nil, team_to_bet: nil, under_percent: 44.0,
     updated_at: ~N[2017-02-16 03:06:58.401363], vegas_over_under: 136.5}
  end

  def valid_game5 do
    # team_to_bet:
    # public_percentage_on_massey_team:
    %TheSpread.Game{
     away_team_bet_count: 274, away_team_final_score: 61,
     away_team_massey_line: 10.5, away_team_name: "james madison dukes",
     away_team_spread_percent: 30.0, away_team_vegas_line: 7.0,
     correct_over_under_prediction: false, correct_prediction: false,
     game_over: true, home_team_bet_count: 645,
     home_team_final_score: 67, home_team_massey_line: -10.5,
     home_team_name: "elon college phoenix", home_team_spread_percent: 70.0,
     home_team_vegas_line: -7.0, id: 752,
     inserted_at: ~N[2017-02-16 03:06:56.566675], line_diff: nil,
     massey_over_under: 128.5, over_percent: 56.0, over_under_diff: nil,
     over_under_pick: nil, public_percentage_on_massey_team: nil,
     sport: "ncaa_basketball", strength: nil, team_to_bet: nil, under_percent: 44.0,
     updated_at: ~N[2017-02-16 03:06:58.409922], vegas_over_under: 133.0}
  end
  # massey says bet on ECU
  test "returns the name of the team massey suggests to bet for valid_game1" do
    team_name = "indiana hoosiers"
    assert Calculate.team_massey_picks(valid_game1) == team_name

    public_percentage_on_massey_team = 66.0
    assert Calculate.public_percentage_on_massey_team(valid_game1) == public_percentage_on_massey_team
  end

  test "returns the name of the team massey suggests to bet valid_game2" do
    team_name = "xavier musketeers"
    assert Calculate.team_massey_picks(valid_game2) == team_name

    public_percentage_on_massey_team = 61.0
    assert Calculate.public_percentage_on_massey_team(valid_game2) == public_percentage_on_massey_team
  end

  test "returns the name of the team massey suggests to bet for valid_game3" do
    team_name = "drake bulldogs"
    assert Calculate.team_massey_picks(valid_game3) == team_name

    public_percentage_on_massey_team = 30.0
    assert Calculate.public_percentage_on_massey_team(valid_game3) == public_percentage_on_massey_team
  end

  test "returns the name of the team massey suggests to bet for valid_game4" do
    team_name = "nebraska cornhuskers"
    assert Calculate.team_massey_picks(valid_game4) == team_name

    public_percentage_on_massey_team = 27.0
    assert Calculate.public_percentage_on_massey_team(valid_game4) == public_percentage_on_massey_team
  end

  test "returns the name of the team massey suggests to bet for valid_game5" do
    team_name = "elon college phoenix"
    assert Calculate.team_massey_picks(valid_game5) == team_name

    public_percentage_on_massey_team = 70.0
    assert Calculate.public_percentage_on_massey_team(valid_game5) == public_percentage_on_massey_team
  end

end
