defmodule TheSpread.Game do
  use TheSpread.Web, :model

  schema "games" do
    field :sport, :string
    field :home_team_name, :string
    field :away_team_name, :string
    field :date, Ecto.Date
    field :home_team_massey_line, :float
    field :away_team_massey_line, :float
    field :home_team_vegas_line, :float
    field :away_team_vegas_line, :float
    field :vegas_over_under, :float
    field :massey_over_under, :float
    field :home_team_final_score, :integer
    field :away_team_final_score, :integer
    field :team_to_bet, :string
    field :line_diff, :float
    field :over_under_diff, :float
    field :over_under_pick, :string
    field :home_team_spread_percent, :float
    field :away_team_spread_percent, :float
    field :over_percent, :float
    field :under_percent, :float
    field :public_percentage_on_massey_team, :float
    field :game_over, :boolean, default: false
    field :correct_prediction, :boolean, default: false
    field :correct_over_under_prediction, :boolean, default: false
    field :strength, :float
    field :home_team_bet_count, :integer
    field :away_team_bet_count, :integer

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:sport, :home_team_name, :away_team_name, :date, :home_team_massey_line, :away_team_massey_line, :home_team_vegas_line, :away_team_vegas_line, :vegas_over_under, :massey_over_under, :home_team_final_score, :away_team_final_score, :team_to_bet, :line_diff, :over_under_diff, :over_under_pick, :home_team_spread_percent, :away_team_spread_percent, :over_percent, :under_percent, :public_percentage_on_massey_team, :game_over, :correct_prediction, :correct_over_under_prediction, :strength, :home_team_bet_count, :away_team_bet_count])
    |> validate_required([:sport, :home_team_name, :away_team_name])
  end
end
