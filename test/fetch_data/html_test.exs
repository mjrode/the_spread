defmodule HTMLTest do
  use ExUnit.Case
  alias TheSpread.HTML
  alias TheSpread.ContructURL

  test "a successfull attempt returns desired HTML source code for ncaa_basketball" do
    url  = ContructURL.massey("ncaa_basketball", "2017-02-10" )
    html = HTML.fetch(url)
    assert String.contains?(html, "Oakland")
  end

  test "a successfull attempt returns desired HTML source code for nfl" do
    url  = ContructURL.massey("nfl", "2017-02-05" )
    html = HTML.fetch(url)
    assert String.contains?(html, "Atlanta")
  end

  test "returns error message when invalid url is passed" do
    url  = ContructURL.massey("invalid", "2017-02-05" )
    html = HTML.fetch(url)
    message = "No match found for invalid on 2017-02-05"
    assert html == message
  end
end
