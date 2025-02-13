defmodule PillPal.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PillPal.Accounts` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        avatar: "some avatar",
        email: "test_email@example.com",
        name: "some name"
      })
      |> PillPal.Accounts.create_user()

    user
  end
end
