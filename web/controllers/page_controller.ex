defmodule TheSpread.PageController do
  use TheSpread.Web, :controller
  alias TheSpread.Game

  def index(conn, _params) do
    correct = Game.correct_games |> length
    total = Game.total_games |> length

    render conn, "index.html", correct: correct, total: total
  end

  def all_games(conn, _params) do
    games = Game.total_games
    render conn, "all_games.html", games: games

  end
end
