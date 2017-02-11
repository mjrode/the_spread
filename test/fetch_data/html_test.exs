defmodule HTMLTest do
  use ExUnit.Case
  alias TheSpread.HTML
  alias TheSpread.ConstructURL

  test "a successfull attempt returns desired HTML source code for ncaa_basketball" do
    url  = ConstructURL.massey("ncaa_basketball", "2017-02-10" )
    html = HTML.fetch(url)
    assert String.contains?(html, "Oakland")
  end

  test "a successfull attempt returns desired HTML source code for nfl" do
    url  = ConstructURL.massey("nfl", "2017-02-05" )
    html = HTML.fetch(url)
    assert String.contains?(html, "Atlanta")
  end

  test "returns error message when invalid url is passed" do
    url  = ConstructURL.massey("invalid", "2017-02-05" )
    html = HTML.fetch(url)
    message = "No match found for invalid on 2017-02-05"
    assert html == message
  end
end
