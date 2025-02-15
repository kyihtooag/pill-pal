defmodule PillPal.Medications.MedicationDosingPeriod do
  use Ecto.Schema
  # import Ecto.Changeset

  alias PillPal.Dosage.DosingPeriod
  alias PillPal.Medications.Medication

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "medication_dosing_periods" do
    belongs_to :medication, Medication
    belongs_to :dosing_period, DosingPeriod

    timestamps()
  end
end
