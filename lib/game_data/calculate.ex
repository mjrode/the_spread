defmodule TheSpread.Calculate do

  def bundle_variables(game) do
    %{
      line_diff: line_diff(game),
      team_to_bet: team_massey_picks(game),
      over_under_diff: over_under_diff(game),
      public_percentage_on_massey_team: public_percentage_on_massey_team(game)
    }

  end

  def valid?(_game) do
    true
  end

  def line_diff(game) do
    abs(game.home_team_massey_line - game.home_team_vegas_line)
  end

  def over_under_diff(game) do
   abs(game.massey_over_under - game.vegas_over_under)
  end

  def public_percentage_on_massey_team(game) do
    cond do
      game.home_team_name == team_massey_picks(game) -> game.home_team_spread_percent
      game.away_team_name == team_massey_picks(game) -> game.home_away_spread_percent
    end
  end

  def team_massey_picks(game) do
    massey = game.home_team_massey_line
    vegas  = game.home_team_vegas_line

    cond  do
      (massey >= 0 && vegas >= 0) && (vegas >= massey) -> game.home_team_name
      (massey >= 0 && vegas >= 0) && (vegas <= massey) -> game.away_team_name
      (massey <= 0 && vegas <= 0 ) && (abs(vegas) <= abs(massey)) -> game.home_team_name
      (massey <= 0 && vegas <= 0 ) && (abs(vegas) >= abs(massey)) -> game.away_team_name
      (massey <= 0 && vegas >= 0) -> game.home_team_name
      (massey <= 0 && vegas >= 0) -> game.away_team_name
      true  -> "#{game.home_team_name}"
    end
  end

  def away_team_won?(game) do
    (game.away_team_massey_line - game.away_team_vegas_line) > 0
  end
end
