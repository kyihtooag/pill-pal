defmodule PillPal.Factory do
  use ExMachina.Ecto, repo: PillPal.Repo

  def user_factory do
    %PillPal.Accounts.User{
      name: "Jane Smith",
      avatar: "some avatar",
      email: sequence(:email, &"email-#{&1}@example.com")
    }
  end

  def dosing_period_factory do
    %PillPal.Dosage.DosingPeriod{
      name: "morning",
      start_time: ~T[06:00:00],
      end_time: ~T[10:00:00]
    }
  end
end
