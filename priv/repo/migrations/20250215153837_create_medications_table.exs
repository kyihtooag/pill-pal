defmodule PillPal.Repo.Migrations.CreateMedicationsTable do
  use Ecto.Migration

  def change do
    create table(:medications, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string, null: false
      add :medication_type, :string, null: false
      add :dosage, :decimal, null: false
      add :unit, :string, null: false
      add :meal_timing, :string, null: false
      add :notes, :text

      add :dosing_period_id, references(:dosing_periods, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:medications, [:name])
    create index(:medications, [:dosing_period_id])
  end
end
