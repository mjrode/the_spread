defmodule TheSpread.GameData do
  import Ecto.Query
  alias TheSpread.Repo
  alias TheSpread.Game
  alias TheSpread.HTML
  alias TheSpread.ParseMasseyData
  alias TheSpread.ParseWunderData
  alias TheSpread.ConstructURL
  alias TheSpread.TeamName
  alias TheSpread.Calculate

  # Game Functions
  def list_games() do
    Repo.all(Game)
  end

    @doc """
    Given a sport, date, and number of days fetch_game_date will
    iterate over the date range and grab all game information for that
    sport from both wunder and massey sites.

    ## Parameters
      - sport: String that represents the sport you want massey_data for
      - date: String in the form of "yyyy-mm-dd" that represents the date of the game
      - days: Integer that represents the number of days you want to iterate over
    ## Examples
      - TheSpread.GameData.fetch_and_insert_wunder_games("ncaa_basketball", "2017-02-10")
  """

  def fetch_game_data(sport, start_date, days) do
    {_, start_date} = Date.from_iso8601(start_date)
    dates = Timex.Interval.new(from: (start_date), until: [days: days]) |> Enum.map(fn(dt) -> Timex.format!(dt, "%Y-%m-%d", :strftime)end)
    Enum.map(dates, fn date -> fetch_game_data(sport, date) end)
  end

  def fetch_game_data(sport, date) do
    fetch_and_insert_wunder_games(sport, date)
    fetch_and_insert_massey_games(sport, date)
  end

  def fetch_and_insert_wunder_games(sport, date) do
    # Fetch and parse html, bundle games in to list of maps
    games = ConstructURL.wunderdog(sport, date)
      |> HTML.fetch
      |> ParseWunderData.bundle_games(sport, date)

      for game <- games do
        find_or_create(game, date)
      end
  end

  def calculate_all_games do
    games = Repo.all(Game)
    for game <- games do
      try do
        params = Calculate.bundle_variables(game)
        case params do
          nil -> nil
          _else ->
          Game.changeset(game, params)
            |> Repo.update
        end
      rescue
        KeyError ->
          nil
      end
    end
  end

  def fetch_and_insert_massey_games(sport, date) do
    games = ConstructURL.massey(sport, date)
      |> HTML.fetch
      |> ParseMasseyData.bundle_games(sport, date)

      for game <- games do
        game_params = prepare_game_params(game)
        game_query = massey_game_query(game, date)
        # require IEx; IEx.pry
        try do
          game_query
           |> Game.changeset(game_params)
           |> Repo.update
        rescue
          FunctionClauseError ->
            nil
        end
      end
  end

  defp find_or_create(game, date) do
    game_query = wunder_game_query(game, date)

    case game_query do
      nil ->
        Game.changeset(%Game{}, game)
          |> Repo.insert()
      _present ->
        Game.changeset(game_query, game)
          |> Repo.update()
    end
  end

  defp wunder_game_query(game, date) do
    Game
      |> where([g], g.home_team_name == ^game.home_team_name)
      |> where([g], g.away_team_name == ^game.away_team_name)
      |> where([g], g.date == ^date)
      |> Repo.one
  end

  defp massey_game_query(game, date) do
    home_team_name = TeamName.format_college_name(game.home_team_name)
    away_team_name = TeamName.format_college_name(game.away_team_name)
    Game
      |> where([g], g.home_team_name == ^home_team_name)
      |> where([g], g.away_team_name == ^away_team_name)
      |> where([g], g.date == ^date)
      |> Repo.one
  end

  defp prepare_game_params(game) do
    Map.delete(game, :home_team_name)
      |> Map.delete(:away_team_name)
      |> Map.delete(:date)
      |> Map.delete(:sport)
  end

  defp find_game(game) do
    home_team_name = TeamName.format_college_name(game.home_team_name)
    away_team_name = TeamName.format_college_name(game.away_team_name)
    date = game.date
    sport = game.sport
    Repo.one(from g in Game, where: (g.home_team_name == ^home_team_name) and (g.away_team_name == ^away_team_name) and (g.date == ^date) and (g.sport == ^sport))
  end
end
