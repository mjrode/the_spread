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
      "ncaa_basketball" -> massey_ncaa_basketball_url(date)
      "nba"             -> massey_nba_url(date)
      "nfl"             -> massey_nfl_url(date)
      "ncaa_football"   -> massey_ncaa_football_url(date)
      _ -> {:error, "No match found for #{sport} on #{date}"}
    end
  end

  def wunderdog(sport, date) do
    case sport do
      "ncaa_basketball" -> wunderdog_ncaa_basketball_url(date)
      "nba"             -> wunderdog_nba_url(date)
      "nfl"             -> wunderdog_nfl_url(date)
      "ncaa_football"   -> wunderdog_ncaa_football_url(date)
      _ -> {:error, "No match found for #{sport} on #{date}"}
    end
  end

  # Fetch massey URL for ncaa_basketball
  defp massey_ncaa_basketball_url(date) do
    "http://www.masseyratings.com/cb/11590/games?dt=#{massey_formatted_date(date)}"
  end

  defp massey_nba_url(date) do
    "http://www.masseyratings.com/nba/games?dt=#{massey_formatted_date(date)}"
  end

  defp massey_nfl_url(date) do
    "http://www.masseyratings.com/nfl/games?dt=#{massey_formatted_date(date)}"
  end

  defp massey_ncaa_football_url(date) do
    "http://www.masseyratings.com/cf/11604/games?dt=#{massey_formatted_date(date)}"
  end

  defp wunderdog_ncaa_basketball_url(date) do
    "http://www.wunderdog.com/public-consensus/cbb.html?date=#{wunderdog_formatted_date(date)}"
  end

  defp wunderdog_nfl_url(date) do
    "http://www.wunderdog.com/public-consensus/nfl.html?date=#{wunderdog_formatted_date(date)}"
  end

  defp wunderdog_nba_url(date) do
    "http://www.wunderdog.com/public-consensus/nba.html?date=#{wunderdog_formatted_date(date)}"
  end

  defp wunderdog_ncaa_football_url(date) do
    "http://www.wunderdog.com/public-consensus/cfb.html?date=#{wunderdog_formatted_date(date)}"
  end


  # Use this in other module
  # defp today_formatted_date do
  #   date = DateTime.utc_now
  #  "#{date.year}-#{date.month}-#{date.day}"
  # end
  defp massey_formatted_date(date) do
    String.replace(date, "-", "")
  end

  def wunderdog_formatted_date(date) do
    [year, month, day] = String.split(date, "-")
    "#{month}%2F#{day}%2F#{year}"
  end
end
