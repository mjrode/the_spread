defmodule TheSpread.GameData do
  import Ecto
  import Ecto.Query
  import Ecto.Changeset
  alias TheSpread.Repo
  alias TheSpread.Game
  alias TheSpread.HTML
  alias TheSpread.ParseMasseyData
  alias TheSpread.ParseWunderData
  alias TheSpread.ConstructURL

  # Game Functions
  def list_games() do
    Repo.all(Game)
  end

  def create_game(game_params) do
    Game.changeset(game_params)
      |> Repo.insert
  end

  @doc """
    Fetches and stores a collection of games given that sport and date

    ## Parameters
      - sport: String that represents the sport you want massey_data for
      - date: String in the form of "yyyy-mm-dd" that represents the date of the game
    ## Examples
      - TheSpread.GameData.fetch_and_insert_wunder_games("ncaa_basketball", "2017-02-10")
  """
  def fetch_and_insert_wunder_games(sport, date) do
    # Fetch and parse html, bundle games in to list of maps
    games = ConstructURL.wunderdog(sport, date)
      |> HTML.fetch
      |> ParseWunderData.bundle_games(sport, date)
      
      for game <- games do
        find_or_create(game, date)
      end
  end

  def fetch_and_insert_massey_games(sport, date) do
    games = ConstructURL.massey(sport, date)
      |> HTML.fetch
      |> ParseMasseyData.bundle_games(sport, date)

      for game <- games do
        home_team_name = TheSpread.TeamName.format_college_name(game.home_team_name)
        date = game.date
        sport = game.sport
        game_params = Map.delete(game, :home_team_name)
          |> Map.delete(:away_team_name)
          |> Map.delete(:date)
          |> Map.delete(:sport)
        require IEx; IEx.pry
        Repo.one(from g in Game, where: (g.home_team_name == ^home_team_name) and (g.date == ^date) and (g.sport == ^sport))
         |> Repo.update(game_params)
      end
  end

  def get_game(id) do
    Repo.get!(Game, id)
  end

  def update_game(id, game_params) do
    Repo.get!(Game, id)
      |> Game.changeset(game_params)
      |> Repo.update
  end

  def delete_game(id) do
    Repo.get!(Game, id)
      |> Repo.delete!
  end

  defp find_or_create(game, date) do
    game_query = game_query(game, date)

    case game_query do
      nil ->
        Game.changeset(%Game{}, game)
          |> Repo.insert()
      _present ->
        Game.changeset(game_query, game)
          |> Repo.update()
    end
  end

  defp game_query(game, date) do
    Game
      |> where([g], g.home_team_name == ^game.home_team_name)
      |> where([g], g.away_team_name == ^game.away_team_name)
      |> where([g], g.date == ^date)
      |> Repo.one
  end
end
