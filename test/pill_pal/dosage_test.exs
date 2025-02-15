defmodule PillPal.DosageTest do
  use PillPal.DataCase

  alias PillPal.Dosage

  describe "dosing_period" do
    alias PillPal.Dosage.DosingPeriod

    @invalid_attrs %{name: nil, start_time: nil, end_time: nil}

    test "list_dosing_periods/0 returns all dosing_periods" do
      dosing_period = Factory.insert(:dosing_period)
      assert Dosage.list_dosing_periods() == [dosing_period]
    end

    test "get_dosing_period!/1 returns the dosing_period with given id" do
      dosing_period = Factory.insert(:dosing_period)
      assert Dosage.get_dosing_period!(dosing_period.id) == dosing_period
    end

    test "get_dosing_period_by_name!/1 returns the dosing_period with given email" do
      dosing_period = Factory.insert(:dosing_period)
      assert Dosage.get_dosing_period_by_name!(dosing_period.name) == dosing_period
    end

    test "create_dosing_period/1 with valid data creates a dosing_period" do
      valid_attrs = %{
        name: "morning",
        start_time: ~T[06:00:00],
        end_time: ~T[10:00:00]
      }

      assert {:ok, %DosingPeriod{} = dosing_period} = Dosage.create_dosing_period(valid_attrs)

      assert dosing_period.name == "morning"
      assert dosing_period.start_time == ~T[06:00:00]
      assert dosing_period.end_time == ~T[10:00:00]
    end

    test "create_dosing_period/1 with existing name returns error changeset" do
      Factory.insert(:dosing_period, name: "morning")

      attrs = %{
        name: "morning",
        start_time: ~T[06:00:00],
        end_time: ~T[10:00:00]
      }

      assert {:error, %Ecto.Changeset{}} = Dosage.create_dosing_period(attrs)
    end

    test "create_dosing_period/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Dosage.create_dosing_period(@invalid_attrs)
    end

    test "update_dosing_period/2 with valid data updates the dosing_period" do
      dosing_period = Factory.insert(:dosing_period)

      update_attrs = %{
        name: "afternoon",
        start_time: ~T[12:00:00],
        end_time: ~T[15:00:00]
      }

      assert {:ok, %DosingPeriod{} = dosing_period} =
               Dosage.update_dosing_period(dosing_period, update_attrs)

      assert dosing_period.name == "afternoon"
      assert dosing_period.start_time == ~T[12:00:00]
      assert dosing_period.end_time == ~T[15:00:00]
    end

    test "update_dosing_period/2 with invalid data returns error changeset" do
      dosing_period = Factory.insert(:dosing_period)

      assert {:error, %Ecto.Changeset{}} =
               Dosage.update_dosing_period(dosing_period, @invalid_attrs)

      assert dosing_period == Dosage.get_dosing_period!(dosing_period.id)
    end

    test "delete_dosing_period/1 deletes the dosing_period" do
      dosing_period = Factory.insert(:dosing_period)
      assert {:ok, %DosingPeriod{}} = Dosage.delete_dosing_period(dosing_period)
      assert_raise Ecto.NoResultsError, fn -> Dosage.get_dosing_period!(dosing_period.id) end
    end

    test "change_dosing_period/1 returns a dosing_period changeset" do
      dosing_period = Factory.insert(:dosing_period)
      assert %Ecto.Changeset{} = Dosage.change_dosing_period(dosing_period)
    end
  end
end
