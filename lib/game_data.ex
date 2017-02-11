defmodule TheSpread.GameData do
  import Ecto
  alias TheSpread.Repo
  alias TheSpread.Game

  # Game Functions
  def list_games() do
    Repo.all(Game)
  end

  def create_game(game_params) do
    Game.changeset(game_params)
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
