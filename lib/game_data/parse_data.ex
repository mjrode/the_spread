defmodule TheSpread.ParseData do


    @doc """
      Returns a List with all of the game data for that day
    """
    def set_variables(row) do
      # I should have access to the date in the persistence layer
      %{
        home_team_name: home_team_name(row),
        away_team_name: away_team_name(row),
        home_team_massey_line: home_team_massey_line(row),
        away_team_massey_line: away_team_massey_line(row),
        massey_over_under: massey_over_under(row),
        game_over: game_over?(row)
      }
    end

    def extract_data(html) do
      table = massey_table(html)
      for row <- table, do: set_variables(row)
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
      #This is horrible and I feel bad doing it
      {_ ,_ , over_under} =
        Floki.find(row, ".fscore")
          |> List.last
          |> Floki.find(".fscore")
          |> List.last
      over_under
        |> List.first
        |> String.to_float
    end
end
