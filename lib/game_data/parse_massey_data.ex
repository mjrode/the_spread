defmodule TheSpread.ParseMasseyData do
    @moduledoc """
      Expects: A map of games returned from `JSON.fetch`

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
    def bundle_games(games_map, sport, date) do
      games = games_map["DI"]
      for game <- games, do: set_variables(game, sport, date)
    end

    def parse_list(game) do
      [ _ | tail ] = game
      [game_over | tail ] = tail
      [team_name_1 | tail] = tail
      [team_name_2 | tail] = tail
      [_ | tail] = tail
      [_ | tail] = tail
      [away_score| tail] = tail
      [home_score | tail] = tail
      [_ | tail] = tail
      [_ | tail] = tail
      [_ | spread_data] = tail
      [_, away_line, home_line, over_1, over_2] = spread_data

      %{
        game_over: game_over,
        team_name_1: team_name_1,
        team_name_2: team_name_2,
        away_line: away_line,
        home_line: home_line,
        over_1: over_1,
        over_2: over_2,
        home_score: home_score,
        away_score: away_score
      }
    end
    # Left public for testing
    def set_variables(game, sport, date) do
      %{
        date: format_date(date),
        sport: sport,
        home_team_name: home_team_name(game),
        away_team_name: away_team_name(game),
        home_team_massey_line: home_team_massey_line(game),
        away_team_massey_line: away_team_massey_line(game),
        massey_over_under: massey_over_under(game),
        game_over: game_over?(game)
      }
    end

    def home_team_name(game) do
      game = parse_list(game)
      team_name =
        case home_team?(game.team_name_1) do
          true ->
            Enum.fetch(game.team_name_1,0)
          _ ->
            Enum.fetch(game.team_name_2, 0)
        end
      {_, team_name} = team_name
      String.replace(team_name, "@ ", "") |> String.downcase
    end

    def away_team_name(game) do
      game = parse_list(game)
      team_name =
        case home_team?(game.team_name_1) do
          true ->
            {_, team_name} = Enum.fetch(game.team_name_2,0)
          _ ->
            {_, team_name} = Enum.fetch(game.team_name_1, 0)
        end
      {_, team_name} = team_name
      String.downcase(team_name)
    end

    def home_team?(team_name) do
      List.to_string(team_name) |> String.contains?("@")
    end

    def game_over?(game) do
      {_, link} = Enum.fetch(game, 1)
      List.to_string(link) |> String.contains?("FINAL")

    end

    def home_team_massey_line(game) do
      game = parse_list(game)
      case Enum.fetch(game.home_line,1) == {:ok, "ltgreen"} do
        true ->
          {:ok, line} = Enum.fetch(game.home_line,0)
          line
        _ -> {:ok, line} = Enum.fetch(game.away_line,0)
          line * -1
      end
    end

    def away_team_massey_line(game) do
      home_team_massey_line(game) * -1
    end

    def massey_over_under(game) do
      game = parse_list(game)
      case Enum.fetch(game.over_1, 1) == {:ok, "ltgreen"} do
        true ->
          {:ok, over} = Enum.fetch(game.over_1, 0)
          over
        _ ->
          {:ok, over} = Enum.fetch(game.over_2, 0)
      end
    end

    def home_team_final_score(game) do
      game = parse_list(game)
      {:ok, score} = Enum.fetch(game.home_score, 0)
      score
    end

    def away_team_final_score(game) do
      game = parse_list(game)
      {:ok, score} = Enum.fetch(game.away_score, 0)
      score
    end

    def format_date(date) do
      {_, date} = Date.from_iso8601(date)
      date
    end
end
