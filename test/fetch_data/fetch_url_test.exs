defmodule FetchURLTest do
  use ExUnit.Case
  alias TheSpread.FetchURL
  #
  # test "should return valid html when passed date and ncaa_basketball" do
  #   date = "2017-02-10"
  #   sport = "ncaa_basketball"
  #   massey_html = FetchURL.massey(sport, date)
  #   assert String.contains?(massey_html, "@ Princeton")
  # end

  test "should get current_url with valid_date and nba" do
    date = "2017-02-10"
    sport = "nba"
    url = "http://www.masseyratings.com/nba/games?dt=20170210"
    massey_url = FetchURL.massey(sport, date)
    assert url == massey_url
  end

  test "should return error with invalid sport and valid_date" do
    date = "2017-02-10"
    sport = "invalid"
    error_message = {:error, "No match found for invalid on 2017-02-10"}
    massey_url = FetchURL.massey(sport, date)
    assert massey_url == error_message
  end

  test "should get current_url with valid_date and nfl" do
    date = "2017-02-10"
    sport = "nfl"
    url = "http://www.masseyratings.com/nfl/games?dt=20170210"
    massey_url = FetchURL.massey(sport, date)
    assert url == massey_url
  end

  test "should get current_url with valid_date and ncaa_football" do
    date = "2017-02-10"
    sport = "ncaa_football"
    url = "http://www.masseyratings.com/cf/11604/games?dt=20170210"
    massey_url = FetchURL.massey(sport, date)
    assert url == massey_url
  end

  test "should return valid html given sport and date" do
    date = "2017-02-10"
    sport = "ncaa_basketball"
    url = "http://www.masseyratings.com/cb/11590/games?dt=20170210"
  end
end
