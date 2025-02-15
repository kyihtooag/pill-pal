defmodule PillPal.Factory do
  use ExMachina.Ecto, repo: PillPal.Repo

  def user_factory do
    %PillPal.Accounts.User{
      name: sequence(:name, &"User-#{&1}"),
      avatar: sequence(:avatar, &"Avatar-#{&1}"),
      email: sequence(:email, &"email-#{&1}@example.com")
    }
  end

  def dosing_period_factory do
    %PillPal.Dosage.DosingPeriod{
      name: sequence(:name, &"Period-#{&1}"),
      start_time: ~T[06:00:00],
      end_time: ~T[10:00:00]
    }
  end

  def medication_factory do
    %PillPal.Medications.Medication{
      name: sequence(:name, &"Medication-#{&1}"),
      medication_type: :tablet,
      dosage: 20.0,
      unit: :mg,
      meal_timing: :after_meal,
      dosing_periods: [
        build(:dosing_period)
      ]
    }
  end

  def medication_dosing_period_factory do
    %PillPal.Medications.MedicationDosingPeriod{
      medication: build(:medication),
      dosing_period: build(:dosing_period),
      inserted_at: NaiveDateTime.utc_now(),
      updated_at: NaiveDateTime.utc_now()
    }
  end
end
