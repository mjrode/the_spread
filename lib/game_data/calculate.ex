defmodule TheSpread.Calculate do

  def bundle_variables(game) do
    if valid?(game) do
      %{
        line_diff: line_diff(game),
        team_to_bet: team_massey_picks(game),
        over_under_diff: over_under_diff(game),
        public_percentage_on_massey_team: public_percentage_on_massey_team(game),
        correct_prediction: correct_prediction(game)
      }
    else
      nil
    end
  end

  def valid?(game) do
    if game.home_team_massey_line != nil && game.away_team_massey_line != nil && game.away_team_spread_percent != nil && game.home_team_spread_percent != nil && game.home_team_name != nil && game.away_team_name != nil &&  game.home_team_vegas_line != nil && game.away_team_vegas_line do
      true
    else
      false
    end
  end

  def correct_prediction(game) do
    if team_to_bet_home_or_away(game) == "home" do
      correct_home_prediction(game)
    else
      correct_away_prediction(game)
    end
  end

  def correct_home_prediction(game) do
    game.home_team_vegas_line > actual_home_line(game)
  end

  def correct_away_prediction(game) do
    game.away_team_vegas_line > actual_away_line(game)
  end

  def actual_home_line(game) do
    (game.away_team_final_score - game.home_team_final_score)
  end

  def actual_away_line(game) do
    (game.home_team_final_score - game.away_team_final_score)
  end

  def team_to_bet_home_or_away(game) do
    if game.team_to_bet == game.away_team_name do
      "away"
    else
      "home"
    end
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
      game.away_team_name == team_massey_picks(game) -> game.away_team_spread_precent
    end
  end

  def team_massey_picks(game) do
    massey = game.home_team_massey_line
    vegas  = game.home_team_vegas_line

    require IEx; IEx.pry
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
