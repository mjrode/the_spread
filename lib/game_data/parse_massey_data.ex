defmodule TheSpread.ParseMasseyData do
    @moduledoc """
      Provides a function `bundle_games/3` which returns a list of Game maps.

      Several methods are left public in here that should not be used by other
      modules but needed to be tested(Needs to be fixed).
    """

    @doc """
      Returns a list of Game maps with massey data.

      ##Parameters
        - sport: String that represents the sport you want massey_data for
        - date: String in the form of "yyyy-mm-dd" that represents the date of the game
        - html: The html that is returned by calling
          ConstructURL.massey(sport, date)
            |> HTML.fetch
    """
    def bundle_games(html, sport, date) do
      table = massey_table(html)
      for row <- table, do: set_variables(row, sport, date)
    end

    # Left public for testing
    def set_variables(row, sport, date) do
      %{
        date: format_date(date),
        sport: sport,
        home_team_name: home_team_name(row),
        away_team_name: away_team_name(row),
        home_team_massey_line: home_team_massey_line(row),
        away_team_massey_line: away_team_massey_line(row),
        massey_over_under: massey_over_under(row),
        game_over: game_over?(row)
      }
    end

    defp massey_table(html) do
      Floki.find(html, "table#tbl tbody tr.bodyrow")
    end

    def home_team_name(row) do
      Floki.find(row, ".fteam.tan a") |> List.last |> Floki.text
    end

    def away_team_name(row) do
      Floki.find(row, ".fteam.tan a") |> List.first |> Floki.text
    end

    def game_over?(row) do
      try  do
         [_, _, _, _] = Floki.find(row, "a")
         true
      rescue
        MatchError -> false
      end
    end

    def home_team_massey_line(row) do
      #pattern match to grab the spread out of the array
      [_, elements, _] = Floki.find(row, ".fscore")
      class = elements
        |> Floki.find("div")
        |> List.last
        |> Floki.attribute("class")
        |> List.to_string
        |> String.trim

      case class do
        "ltgreen" ->
          elements
            |> Floki.find("div")
            |> List.last
            |> Floki.text
            |> String.to_float

        _other    ->
          spread =
            elements
              |> Floki.find("div")
              |> List.first
              |> Floki.text
              |> String.to_float
          spread * -1
      end
    end

    def away_team_massey_line(row) do
      home_team_massey_line(row) * -1
    end

    def massey_over_under(row) do
      # This is horrible and I feel bad doing it
      {_ ,_ , over_under} =
        Floki.find(row, ".fscore")
          |> List.last
          |> Floki.find(".fscore")
          |> List.last
      over_under
        |> List.first
        |> String.to_float
    end

    def home_team_final_score(row) do
      try do
        {_,_, c} =
          Floki.find(row, ".fscore.greybg.white" )
          |> List.last
        {_,_,score} =
          c
          |> List.last
        score
          |> List.to_string
          |> String.to_integer
      rescue
        MatchError -> nil
      end
    end

    def away_team_final_score(row) do
      try do
        {_,_, c} =
          Floki.find(row, ".fscore.greybg.white" )
          c |> List.first |> String.to_integer
      rescue
        MatchError -> nil
      end
    end

    def format_date(date) do
      {_, date} = Date.from_iso8601(date)
      date
    end
end
