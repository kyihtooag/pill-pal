# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     PillPal.Repo.insert!(%PillPal.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
defmodule PillPal.Seeds do
  alias PillPal.Accounts
  alias PillPal.Dosage

  def insert_seed_user do
    Accounts.create_user(%{email: "kyihtooag@gmail.com"})
  end

  def insert_dosing_periods do
    # If you haven't inserted them manually during migration, insert default periods
    dosing_periods = [
      %{name: "morning", start_time: ~T[06:00:00], end_time: ~T[10:00:00]},
      %{name: "afternoon", start_time: ~T[12:00:00], end_time: ~T[15:00:00]},
      %{name: "evening", start_time: ~T[18:00:00], end_time: ~T[20:00:00]},
      %{name: "midnight", start_time: ~T[21:00:00], end_time: ~T[00:00:00]}
    ]

    Enum.each(dosing_periods, &Dosage.create_dosing_period(&1))
  end
end

# Executing the seed functions

PillPal.Seeds.insert_seed_user()
PillPal.Seeds.insert_dosing_periods()
