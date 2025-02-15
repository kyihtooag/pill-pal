defmodule PillPal.Medications.Medication do
  use Ecto.Schema
  import Ecto.Changeset

  @meal_timing [:before_meal, :after_meal]

  @required_fields [:name, :medication_type, :dosage, :unit, :meal_timing, :dosing_period_id]
  @fields @required_fields ++ [:notes]

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "medications" do
    field :name, :string
    field :medication_type, PillPal.Medications.TypesEnum
    field :dosage, :decimal
    field :unit, PillPal.Medications.UnitsEnum
    field :meal_timing, Ecto.Enum, values: @meal_timing, default: :after_meal
    field :notes, :string

    belongs_to(:dosing_period, PillPal.Dosage.DosingPeriod)
    timestamps()
  end

  def changeset(medication, attrs) do
    medication
    |> cast(attrs, @fields)
    |> validate_required(@required_fields)
  end
end
