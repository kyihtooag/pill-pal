defmodule PillPal.Repo.Migrations.CreateMedicationDosingPeriodsTable do
  use Ecto.Migration

  def change do
    create table(:medication_dosing_periods, primary_key: false) do
      add :id, :binary_id, primary_key: true

      add :medication_id, references(:medications, on_delete: :delete_all, type: :binary_id),
        null: false

      add :dosing_period_id,
          references(:dosing_periods, on_delete: :delete_all, type: :binary_id),
          null: false

      timestamps()
    end

    create unique_index(:medication_dosing_periods, [:medication_id, :dosing_period_id])
  end
end
