defmodule PillPal.Medications do
  @moduledoc """
  The Medications context.
  """

  import Ecto.Query, warn: false
  alias PillPal.Repo
  alias PillPal.Medications.Medication

  # START: Medication

  @doc """
  Returns the list of medications.

  ## Examples

      iex> list_medications()
      [%Medication{}, ...]

  """
  def list_medications do
    Repo.all(Medication)
  end

  @doc """
  Gets a single medication.

  Raises `Ecto.NoResultsError` if the Medication does not exist.

  ## Examples

      iex> get_medication!(id)
      %Medication{}

      iex> get_medication!(id)
      ** (Ecto.NoResultsError)

  """
  def get_medication!(id), do: Repo.get!(Medication, id)

  @doc """
  Gets a single medication by dosing_period_id.

  Raises `Ecto.NoResultsError` if the Medication does not exist.

  ## Examples

      iex> get_medication_by_dosing_period_id!(morning)
      %Medication{}

      iex> get_medication_by_dosing_period_id!(evening)
      ** (Ecto.NoResultsError)

  """
  def get_medication_by_dosing_period_id!(dosing_period_id),
    do: Repo.get_by!(Medication, dosing_period_id: dosing_period_id)

  @doc """
  Creates a medication.

  ## Examples

      iex> create_medication(%{field: value})
      {:ok, %Medication{}}

      iex> create_medication(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_medication(attrs \\ %{}) do
    %Medication{}
    |> Medication.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a medication.

  ## Examples

      iex> update_medication(medication, %{field: new_value})
      {:ok, %Medication{}}

      iex> update_medication(medication, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_medication(%Medication{} = medication, attrs) do
    medication
    |> Medication.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a medication.

  ## Examples

      iex> delete_medication(medication)
      {:ok, %Medication{}}

      iex> delete_medication(medication)
      {:error, %Ecto.Changeset{}}

  """
  def delete_medication(%Medication{} = medication) do
    Repo.delete(medication)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking medication changes.

  ## Examples

      iex> change_medication(medication)
      %Ecto.Changeset{data: %Medication{}}

  """
  def change_medication(%Medication{} = medication, attrs \\ %{}) do
    Medication.changeset(medication, attrs)
  end

  # END: Medication
end
