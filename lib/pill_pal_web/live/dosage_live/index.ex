defmodule PillPalWeb.DosageLive.Index do
  @moduledoc """
  Live route for listing coaches.
  """

  use PillPalWeb, :live_view

  alias PillPal.Dosage
  alias PillPal.Dosage.DosingPeriod
  # alias PillPal.Medications
  alias PillPal.Medications.Medication

  @impl true
  def mount(_params, _session, socket) do
    socket =
      if connected?(socket) do
        dosing_periods = Dosage.list_dosing_periods()

        socket
        |> assign(:loading, false)
        |> assign(:medications, [])
        |> assign(:dosing_periods, dosing_periods)
      else
        assign(socket, :loading, true)
      end

    {:ok, socket}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :medication_new, _params) do
    socket
    |> assign(:page_title, "New Medications")
    |> assign(:medication, %Medication{})
  end

  defp apply_action(socket, :dosing_periods, _params) do
    socket
    |> assign(:page_title, "Dosing Periods")
    |> assign(:dosing_period, %DosingPeriod{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Dosage")
  end

  defp format_time_range(start_time, end_time) do
    start_time_str = format_time(start_time)
    end_time_str = format_time(end_time)
    "#{start_time_str} - #{end_time_str}"
  end

  # Format the time to the desired string format (e.g., "6:00 AM")
  defp format_time(time), do: Calendar.strftime(time, "%-I:%M %p")
end
