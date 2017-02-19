defmodule ConstructURLTest do
  use ExUnit.Case
  alias TheSpread.ConstructURL

  test "should return valid url when passed date and ncaa_basketball" do
    date = "2017-02-02"
    sport = "ncaa_basketball"
    url = "http://www.masseyratings.com/predjson.php?s=cb&sub=11590&dt=20170202"
    massey_url = ConstructURL.massey(sport, date)
    assert url == massey_url
  end

  test "should return valid url when passed date and nba" do
    date = "2017-02-02"
    sport = "nba"
    url = "http://www.masseyratings.com/predjson.php?s=nba&dt=20170202"
    massey_url = ConstructURL.massey(sport, date)
    assert url == massey_url
  end


  test "should return valid url when passed date and nfl" do
    date = "2017-02-02"
    sport = "nfl"
    url = "http://www.masseyratings.com/predjson.php?s=nfl&dt=20170202"
    massey_url = ConstructURL.massey(sport, date)
    assert url == massey_url
  end

  test "should return valid url when passed date and ncaa_football" do
    date = "2017-02-02"
    sport = "ncaa_football"
    url = "http://www.masseyratings.com/predjson.php?s=cf&sub=11604&dt=20170202"
    massey_url = ConstructURL.massey(sport, date)
    assert url == massey_url
  end

  test "should return error with invalid sport and valid_date" do
    date = "2017-02-02"
    sport = "invalid"
    error_message = {:error, "No match found for invalid on 2017-02-02"}
    massey_url = ConstructURL.massey(sport, date)
    assert massey_url == error_message
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
