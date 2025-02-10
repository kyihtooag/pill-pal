defmodule PillPal.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  # Use UUID as primary key
  @primary_key {:id, :binary_id, autogenerate: true}
  # Optional: JSON encoding support
  @derive {Jason.Encoder, only: [:id, :name, :email, :avatar]}
  schema "users" do
    field :name, :string
    field :email, :string
    field :avatar, :string

    timestamps()
  end

  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email, :avatar])
    |> validate_required([:email])
    |> unique_constraint(:email)
  end
end
