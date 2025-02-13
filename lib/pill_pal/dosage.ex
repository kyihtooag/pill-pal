defmodule PillPal.Dosage do
  @moduledoc """
  The Dosage context.
  """

  import Ecto.Query, warn: false
  alias PillPal.Repo
  alias PillPal.Dosage.DosingPeriod

  # START: Dosing Period

  @doc """
  Returns the list of dosing_periods.

  ## Examples

      iex> list_dosing_periods()
      [%DosingPeriod{}, ...]

  """
  def list_dosing_periods do
    Repo.all(DosingPeriod)
  end

  @doc """
  Gets a single dosing_period.

  Raises `Ecto.NoResultsError` if the DosingPeriod does not exist.

  ## Examples

      iex> get_dosing_period!(id)
      %DosingPeriod{}

      iex> get_dosing_period!(id)
      ** (Ecto.NoResultsError)

  """
  def get_dosing_period!(id), do: Repo.get!(DosingPeriod, id)

  @doc """
  Gets a single dosing_period by name.

  Raises `Ecto.NoResultsError` if the DosingPeriod does not exist.

  ## Examples

      iex> get_dosing_period_by_name!(morning)
      %DosingPeriod{}

      iex> get_dosing_period_by_name!(evening)
      ** (Ecto.NoResultsError)

  """
  def get_dosing_period_by_name!(name), do: Repo.get_by!(DosingPeriod, name: name)

  @doc """
  Creates a dosing_period.

  ## Examples

      iex> create_dosing_period(%{field: value})
      {:ok, %DosingPeriod{}}

      iex> create_dosing_period(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_dosing_period(attrs \\ %{}) do
    %DosingPeriod{}
    |> DosingPeriod.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a dosing_period.

  ## Examples

      iex> update_dosing_period(dosing_period, %{field: new_value})
      {:ok, %DosingPeriod{}}

      iex> update_dosing_period(dosing_period, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_dosing_period(%DosingPeriod{} = dosing_period, attrs) do
    dosing_period
    |> DosingPeriod.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a dosing_period.

  ## Examples

      iex> delete_dosing_period(dosing_period)
      {:ok, %DosingPeriod{}}

      iex> delete_dosing_period(dosing_period)
      {:error, %Ecto.Changeset{}}

  """
  def delete_dosing_period(%DosingPeriod{} = dosing_period) do
    Repo.delete(dosing_period)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking dosing_period changes.

  ## Examples

      iex> change_dosing_period(dosing_period)
      %Ecto.Changeset{data: %DosingPeriod{}}

  """
  def change_dosing_period(%DosingPeriod{} = dosing_period, attrs \\ %{}) do
    DosingPeriod.changeset(dosing_period, attrs)
  end

  # END: Dosing Period
end
