defmodule ConstructURLTest do
  use ExUnit.Case
  alias TheSpread.ConstructURL

  test "should return valid html when passed date and ncaa_basketball" do
    date = "2017-02-10"
    sport = "ncaa_basketball"
    url = "http://www.masseyratings.com/cb/11590/games?dt=20170210"
    massey_url = ConstructURL.massey(sport, date)
    assert url == massey_url
  end

  test "should get current_url with valid_date and nba" do
    date = "2017-02-10"
    sport = "nba"
    url = "http://www.masseyratings.com/nba/games?dt=20170210"
    massey_url = ConstructURL.massey(sport, date)
    assert url == massey_url
  end

  test "should return error with invalid sport and valid_date" do
    date = "2017-02-10"
    sport = "invalid"
    error_message = {:error, "No match found for invalid on 2017-02-10"}
    massey_url = ConstructURL.massey(sport, date)
    assert massey_url == error_message
  end

  test "should get current_url with valid_date and nfl" do
    date = "2017-02-10"
    sport = "nfl"
    url = "http://www.masseyratings.com/nfl/games?dt=20170210"
    massey_url = ConstructURL.massey(sport, date)
    assert url == massey_url
  end

  test "should get current_url with valid_date and ncaa_football" do
    date = "2017-02-10"
    sport = "ncaa_football"
    url = "http://www.masseyratings.com/cf/11604/games?dt=20170210"
    massey_url = ConstructURL.massey(sport, date)
    assert url == massey_url
  end

  test "should get wunderdog with valid_date and ncaa_football" do
    date = "2017-02-10"
    sport = "ncaa_football"
    url = "http://www.wunderdog.com/public-consensus/cfb.html?date=02%2F10%2F2017"
    wunderdog_url = ConstructURL.wunderdog(sport, date)
    assert url == wunderdog_url
  end

  test "should get wunderdog with valid_date and ncaa_basketball" do
    date = "2017-02-10"
    sport = "ncaa_basketball"
    url = "http://www.wunderdog.com/public-consensus/cbb.html?date=02%2F10%2F2017"
    wunderdog_url = ConstructURL.wunderdog(sport, date)
    assert url == wunderdog_url
  end

  test "should get wunderdog with valid_date and nba" do
    date = "2017-02-10"
    sport = "nba"
    url = "http://www.wunderdog.com/public-consensus/nba.html?date=02%2F10%2F2017"
    wunderdog_url = ConstructURL.wunderdog(sport, date)
    assert url == wunderdog_url
  end

  test "should get wunderdog with valid_date and nfl" do
    date = "2017-02-10"
    sport = "nfl"
    url = "http://www.wunderdog.com/public-consensus/nfl.html?date=02%2F10%2F2017"
    wunderdog_url = ConstructURL.wunderdog(sport, date)
    assert url == wunderdog_url
  end

end
