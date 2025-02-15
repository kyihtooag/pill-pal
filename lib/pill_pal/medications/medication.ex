defmodule PillPal.Medications.Medication do
  use Ecto.Schema
  import Ecto.Changeset

  alias PillPal.Dosage.DosingPeriod
  alias PillPal.Medications.MedicationDosingPeriod

  @meal_timing [:before_meal, :after_meal]

  @required_fields [:name, :medication_type, :dosage, :unit, :meal_timing]
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

    many_to_many(:dosing_periods, DosingPeriod,
      join_through: MedicationDosingPeriod,
      on_replace: :delete
    )

    timestamps()
  end

  def changeset(medication, attrs) do
    medication
    |> cast(attrs, @fields)
    |> validate_required(@required_fields)
    |> unique_constraint([:name, :unit])
    |> put_assoc(:dosing_periods, Map.get(attrs, :dosing_periods, []))
    |> validate_dosing_periods(attrs)
  end

  # If medication is new or dosing_periods is provided in the attrs, validate that at least one dosing period is present
  defp validate_dosing_periods(changeset, attrs) do
    if !changeset.data.id || Map.has_key?(attrs, :dosing_periods) do
      validate_length(changeset, :dosing_periods,
        min: 1,
        message: "At least one dosing period is required"
      )
    else
      changeset
    end
  end
end
