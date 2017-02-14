defmodule TheSpread.HTML do
  @moduledoc """
    Provides a function `fetch/1` to fetch html source code
  """
  use Hound.Helpers
  @doc """
    Returns html source code for the given url.
    You need to make sure the phantom js webdriver is running to use this module.
    To start the webdriver type `phantomjs --wd` in your terminal.

    ## Parameters
      - url: String that represents the url of a website
  """

  # This error handling is probably in the wrong location
  # Only works when receiving url from ConstructURL
  def fetch(url) do
    case url do
      {:error, message} ->
        message
      _success ->
        Hound.start_session
        navigate_to(url)
        page_source
    end
  end
end
