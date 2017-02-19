defmodule JSON do
  # Expects `url` from `ConstructURL.massey(sport, date)`
  # Returns a map of games
  def fetch(url) do
    {:ok, json} = HTTPoison.get(url)
    json = json.body |> Poison.decode
    {_, game_map} = json
    game_map
  end
end
