defmodule FetchHTMLTest do
  use ExUnit
  alias TheSpread.FetchHTML
  alias TheSpread.ContructURL

  test "a successfull attempt returns desired HTML source code" do
    url  = ContructURL.massey("2017-02-10", "ncaa_basketball")
    html = FetchHTML.fetch_html
  end

end
