defmodule PillPalWeb.DosageLive.DosingPeriods.ListComponent do
  use PillPalWeb, :live_component

  alias PillPal.Dosage
  alias PillPal.Medications

  @impl true
  def update(%{dosing_period: dosing_period} = assigns, socket) do
    changeset = Dosage.change_dosing_period(dosing_period)

    {:ok,
     socket
     |> assign(assigns)
     |> assign_form(changeset)}
  end

  @impl true
  def handle_event("validate", %{"dosing_period" => dosing_period_params}, socket) do
    changeset =
      socket.assigns.medication
      |> Dosage.change_dosing_period(dosing_period_params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end

  def handle_event("save", %{"dosing_period" => dosing_period_params}, socket) do
    save_medication(socket, socket.assigns.action, dosing_period_params)
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <header class={["flex items-center justify-between gap-6"]}>
        <div>
          <h1 class="text-lg font-semibold leading-8 text-zinc-800">
            Dosing Periods
          </h1>
          <p class="mt-2 text-sm leading-6 text-zinc-600">
            Use this form to manage your dosing periods.
          </p>
        </div>
      </header>

      <.header>
        {@title}
        <:subtitle>Use this form to manage user records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="dosing-period-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:name]} type="text" label="Name" />
        <:actions>
          <.button phx-disable-with="Saving...">Cancel</.button>
        </:actions>
        <:actions>
          <.button phx-disable-with="Saving...">Save Dosing Period</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  defp save_medication(socket, :new, medication_params) do
    case Medications.create_medication(medication_params) do
      {:ok, medication} ->
        notify_parent({:saved, medication})

        {:noreply,
         socket
         |> put_flash(:info, "Medication created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp save_medication(socket, :edit, medication_params) do
    case Medications.update_medication(socket.assigns.medication, medication_params) do
      {:ok, medication} ->
        notify_parent({:saved, medication})

        {:noreply,
         socket
         |> put_flash(:info, "Medication updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp assign_form(socket, %Ecto.Changeset{} = changeset) do
    assign(socket, :form, to_form(changeset))
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
