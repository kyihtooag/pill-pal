defmodule PillPal.MedicationsTest do
  use PillPal.DataCase

  alias PillPal.Medications

  describe "medication" do
    alias PillPal.Medications.Medication

    @invalid_attrs %{
      name: nil,
      medication_type: nil,
      dosage: nil,
      unit: nil,
      meal_timing: nil,
      notes: nil,
      dosing_periods: []
    }

    test "list_medications/0 returns all medications" do
      medication = Factory.insert(:medication)
      assert Medications.list_medications() == [medication]
    end

    test "get_medication!/1 returns the medication with given id" do
      medication = Factory.insert(:medication)
      assert Medications.get_medication!(medication.id) == medication
    end

    test "create_medication/1 with valid data creates a medication" do
      dosing_period = Factory.insert(:dosing_period)

      valid_attrs = %{
        name: "Paracetamol",
        medication_type: :tablet,
        dosage: 20.0,
        unit: :mg,
        meal_timing: :after_meal,
        dosing_periods: [dosing_period]
      }

      assert {:ok, %Medication{} = medication} =
               Medications.create_medication(valid_attrs)

      assert medication.name == "Paracetamol"
      assert medication.medication_type == :tablet
      assert medication.dosage == Decimal.new("20.0")
      assert medication.unit == :mg
      assert medication.meal_timing == :after_meal
    end

    test "create_medication/1 with existing name and unit returns error changeset" do
      medication = Factory.insert(:medication)
      dosing_period = Factory.insert(:dosing_period)

      attrs = %{
        name: medication.name,
        medication_type: :tablet,
        dosage: 20.0,
        unit: medication.unit,
        meal_timing: :after_meal,
        dosing_periods: [dosing_period]
      }

      assert {:error, %Ecto.Changeset{}} = Medications.create_medication(attrs)
    end

    test "create_medication/1 without dosing_periods returns error changeset" do
      attrs = %{
        name: "Test",
        medication_type: :tablet,
        dosage: 20.0,
        unit: :mg,
        meal_timing: :after_meal
      }

      assert {:error, %Ecto.Changeset{}} = Medications.create_medication(attrs)
    end

    test "create_medication/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Medications.create_medication(@invalid_attrs)
    end

    test "update_medication/2 with valid data updates the dosing_period" do
      medication = Factory.insert(:medication)

      update_attrs = %{
        name: "Test 2",
        dosage: 10,
        unit: :g
      }

      assert {:ok, %Medication{} = updated_medication} =
               Medications.update_medication(medication, update_attrs)

      assert updated_medication.name == "Test 2"
      assert updated_medication.dosage == Decimal.new(10)
      assert updated_medication.unit == :g
    end

    test "update_medication/2 with invalid data returns error changeset" do
      medication = Factory.insert(:medication)

      assert {:error, %Ecto.Changeset{}} =
               Medications.update_medication(medication, @invalid_attrs)

      assert medication == Medications.get_medication!(medication.id)
    end

    test "get_medication/1 deletes the medication" do
      medication = Factory.insert(:medication)
      assert {:ok, %Medication{}} = Medications.delete_medication(medication)
      assert_raise Ecto.NoResultsError, fn -> Medications.get_medication!(medication.id) end
    end

    test "change_medication/1 returns a medication changeset" do
      medication = Factory.insert(:medication)
      assert %Ecto.Changeset{} = Medications.change_medication(medication)
    end
  end
end
