defmodule TheSpread.ConstructURL do
  use Hound.Helpers
  @moduledoc """
    Provides a function `massey/2` that returns the url containing massey data for that
    sport on that date.
  """

  @doc """
    Returns a massey_url that maps to the correct data.

    ##Parameters
      - sport: String that represents the sport you want massey_data for
      - date: String in the form of "yyyy-mm-dd" that represents the date of the game
    ##Examples
      iex> ConstructURL.massey("ncaa_basketball", "2017-02-11")
      "http://www.masseyratings.com/nba/games?dt=20170210"

      iex> ConstructURL.massey("not_valid_sport", "2017-02-11")
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
  end

  defp fetch_nba_url(date) do
    "http://www.masseyratings.com/nba/games?dt=#{massey_formatted_date(date)}"
  end

  defp fetch_nfl_url(date) do
    "http://www.masseyratings.com/nfl/games?dt=#{massey_formatted_date(date)}"
  end

  defp fetch_ncaa_football_url(date) do
    "http://www.masseyratings.com/cf/11604/games?dt=#{massey_formatted_date(date)}"
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
