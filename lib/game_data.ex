defmodule TheSpread.GameData do
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

  def fetch_and_insert_wunder_games(sport, date) do
    games = ConstructURL.wunderdog(sport, date)
      |> HTML.fetch
      |> ParseWunderData.bundle_games(sport, date)

      for game <- games, do: Game.changeset(%Game{}, game)
        |> Repo.insert
  end

  def fetch_and_insert_massey_games(sport, date) do
    games = ConstructURL.massey(sport, date)
      |> HTML.fetch
      |> ParseMasseyData.bundle_games(sport, date)

      for game <- games, do: Game.changeset(%Game{}, game)
        |> Repo.insert
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
end
