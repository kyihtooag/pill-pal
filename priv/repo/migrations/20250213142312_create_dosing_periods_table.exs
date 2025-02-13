defmodule PillPal.Repo.Migrations.CreateDosingPeriodsTable do
  use Ecto.Migration

  def change do
    create table(:dosing_periods, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string, null: false
      add :start_time, :time, null: false
      add :end_time, :time, null: false
      timestamps()
    end

    create unique_index(:dosing_periods, [:name])
  end
end
