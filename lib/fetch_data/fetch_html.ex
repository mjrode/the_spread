defmodule TheSpread.FetchHTML do
  use Hound.Helpers
  @moduledoc """
    Provides a function `massey/2` that returns the html source code for that
    sport on that date.
  """

  @doc """
    Returns a string of HTML corresponding to that sport and date

    ##Parameters
      - sport: String that represents the sport you want massey_data for
      - date: String in the form of "yyyy-mm-dd" that represents the date of the game
    ##Examples
      iex> FetchHTML.massey("ncaa_basketball", "2017-02-11")
      "<!DOCTYPE html><html><head> <meta charset=......"

      iex> FetchHTML.massey("not_valid_sport", "2017-02-11")
      :error, "No match found for not_valid_sport on 2017-02-11"}
  """
  def massey(sport, date) do
    case sport do
      "ncaa_basketball" -> fetch_ncaa_basketball_url(date)
      "nba"             -> fetch_nba_url(date)
      "nfl"             -> fetch_nfl_url(date)
      "ncaa_football"   -> fetch_ncaa_football_url(date)
      _ -> {:error, "No match found for #{sport} on #{date}"}
    end
  end

  # Fetch massey URL for ncaa_basketball
  defp fetch_ncaa_basketball_url(date) do
    "http://www.masseyratings.com/cb/11590/games?dt=#{massey_formatted_date(date)}"
    |> fetch_html
  end

  defp fetch_nba_url(date) do
    "http://www.masseyratings.com/nba/games?dt=#{massey_formatted_date(date)}"
    |> fetch_html
  end

  defp fetch_nfl_url(date) do
    "http://www.masseyratings.com/nfl/games?dt=#{massey_formatted_date(date)}"
    |> fetch_html
  end

  defp fetch_ncaa_football_url(date) do
    "http://www.masseyratings.com/cf/11604/games?dt=#{massey_formatted_date(date)}"
    |> fetch_html
  end

  defp fetch_html(url) do
    Hound.start_session
    navigate_to(url)
    page_source
  end

  # Use this in other module
  # defp today_formatted_date do
  #   date = DateTime.utc_now
  #  "#{date.year}-#{date.month}-#{date.day}"
  # end
  defp massey_formatted_date(date) do
    String.replace(date, "-", "")
  end
end
