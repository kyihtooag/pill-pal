defmodule PillPal.DosageFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PillPal.Dosage` context.
  """

  @doc """
  Generate a dosing_period.
  """
  def dosing_period_fixture(attrs \\ %{}) do
    {:ok, dosing_period} =
      attrs
      |> Enum.into(%{name: "morning", start_time: ~T[06:00:00], end_time: ~T[10:00:00]})
      |> PillPal.Dosage.create_dosing_period()

    dosing_period
  end
end
