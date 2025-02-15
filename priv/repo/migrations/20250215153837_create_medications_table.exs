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

      timestamps()
    end

    create index(:medications, [:name])
    create unique_index(:medications, [:name, :unit])
  end
end
