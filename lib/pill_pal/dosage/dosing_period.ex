defmodule PillPal.Dosage.DosingPeriod do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "dosing_periods" do
    field :name, :string
    field :start_time, :time
    field :end_time, :time

    # has_many :medication_logs, PillPal.MedicationLog
    timestamps()
  end

  def changeset(dosing_period, attrs) do
    dosing_period
    |> cast(attrs, [:name, :start_time, :end_time])
    |> validate_required([:name, :start_time, :end_time])
    |> unique_constraint(:name)
  end
end
