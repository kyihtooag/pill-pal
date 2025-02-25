defmodule PillPalWeb.DosageLive.Medications.FormComponent do
  use PillPalWeb, :live_component

  alias PillPal.Medications

  @impl true
  def update(%{medication: medication} = assigns, socket) do
    changeset = Medications.change_medication(medication)

    {:ok,
     socket
     |> assign(assigns)
     |> assign_form(changeset)}
  end

  @impl true
  def handle_event("validate", %{"medication" => medication_params}, socket) do
    changeset =
      socket.assigns.medication
      |> Medications.change_medication(medication_params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end

  def handle_event("save", %{"medication" => medication_params}, socket) do
    save_medication(socket, socket.assigns.action, medication_params)
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.simple_form
        for={@form}
        id="medication-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:name]} type="text" label="Name" />
        <:actions>
          <.button phx-disable-with="Saving...">Cancel</.button>
        </:actions>
        <:actions>
          <.button phx-disable-with="Saving...">Save medication</.button>
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
