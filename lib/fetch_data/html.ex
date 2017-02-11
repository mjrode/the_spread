defmodule TheSpread.HTML do
  @moduledoc """
    Provides a function `fetch/1` to fetch html source code
  """
  use Hound.Helpers
  @doc """
    Returns html source code for the given url.

    ## Parameters
      - url: String that represents the url of a website
  """

  def fetch(url) do
    Hound.start_session
    navigate_to(url)
    page_source
  end
end
