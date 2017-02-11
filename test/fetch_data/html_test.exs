defmodule HTMLTest do
  use ExUnit.Case
  alias TheSpread.HTML
  alias TheSpread.ContructURL

  test "a successfull attempt returns desired HTML source code" do
    url  = ContructURL.massey("ncaa_basketball", "2017-02-10" )
    html = HTML.fetch(url)
    assert String.contains?(html, "Oakland")
  end

end
