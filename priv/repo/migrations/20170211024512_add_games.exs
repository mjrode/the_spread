defmodule TheSpread.Repo.Migrations.AddGames do
  use Ecto.Migration

  def change do
      create table(:games) do
        add :sport, :string
        add :home_team_name, :string
        add :away_team_name, :string
        add :date, :date
        add :home_team_massey_line, :float
        add :away_team_massey_line, :float
        add :home_team_vegas_line, :float
        add :away_team_vegas_line, :float
        add :vegas_over_under, :float
        add :massey_over_under, :float
        add :home_team_final_score, :integer
        add :away_team_final_score, :integer
        add :team_to_bet, :string
        add :line_diff, :float
        add :over_under_diff, :float
        add :over_under_pick, :string
        add :home_team_spread_percent, :float
        add :away_team_spread_percent, :float
        add :over_percent, :float
        add :under_percent, :float
        add :public_percentage_on_massey_team, :float
        add :game_over, :boolean, default: false, null: false
        add :correct_prediction, :boolean, default: false, null: false
        add :correct_over_under_prediction, :boolean, default: false, null: false
        add :strength, :float

        timestamps()
      end
    end

end
