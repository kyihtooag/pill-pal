defmodule PillPalWeb.PillPall.InsightsLive do
  @moduledoc """
  Live route for listing coaches.
  """

  use PillPalWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    today = Date.utc_today()
    {:ok, assign(socket, current_date: today)}
  end

  @impl true
  def handle_params(_params, _, socket) do
    {:noreply, socket}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="relative z-30 px-0 2xl:px-20">
      <div class="flex items-center w-full">
        <span class="text-lg font-bold">Hi Bob</span>
      </div>

      <div class="flex flex-col w-full h-auto mt-3 space-x-0 space-y-10 xl:flex-row xl:space-x-4 xl:space-y-0">
        <div class="w-full p-4 mx-auto bg-white rounded-lg shadow-xl">
          <!-- Header -->
          <div class="flex items-center justify-between mb-3">
            <button
              phx-click="prev_month"
              class="px-4 py-3 text-sm bg-gray-200 rounded hover:bg-gray-300"
            >
              ←
            </button>
            <h2 class="text-lg font-bold">
              {@current_date |> Date.to_string() |> String.slice(0, 7)}
            </h2>
            <button
              phx-click="next_month"
              class="px-4 py-3 text-sm bg-gray-200 rounded hover:bg-gray-300"
            >
              →
            </button>
          </div>

          <div class="grid grid-cols-7 gap-1 text-center text-md">
            <!-- Weekday Headers -->
            <%= for day <- ~w(Sun Mon Tue Wed Thu Fri Sat) do %>
              <div class="font-semibold text-gray-600">{day}</div>
            <% end %>

            <%= for week <- calendar_days(@current_date) do %>
              <%= for day <- week do %>
                <div class={"border rounded-lg cursor-pointer #{if Date.compare(day, @current_date) == :eq, do: "bg-blue-200 font-bold", else: "bg-gray-100"}"}>
                  <.circular_progress_bar
                    progress={0}
                    radius={25}
                    stroke={8}
                    font_size={16}
                    text_pending={6}
                    text={to_string(day.day)}
                  />
                </div>
              <% end %>
            <% end %>
          </div>
        </div>

        <div class="flex flex-col w-full px-4 pt-4 mx-auto bg-gray-200 rounded-lg">
          <div class="flex items-center justify-between pb-2 mb-2 border-b border-gray-700">
            <div>
              <p class="font-semibold">Zoom call with design team</p>
              <p class="text-xs text-gray-400">Discussion on UX sprint and Wireframe review</p>
            </div>
            <div>
              <p class="text-xs text-gray-400">9:00 AM</p>
            </div>
          </div>

          <div class="flex items-center justify-between pb-2 mb-2 border-b border-gray-700">
            <div>
              <p class="font-semibold">Zoom call with design team</p>
              <p class="text-xs text-gray-400">Discussion on UX sprint and Wireframe review</p>
            </div>
            <div>
              <p class="text-xs text-gray-400">9:00 AM</p>
            </div>
          </div>

          <div class="flex items-center justify-between pb-2 mb-2 border-b border-gray-700">
            <div>
              <p class="font-semibold">Zoom call with design team</p>
              <p class="text-xs text-gray-400">Discussion on UX sprint and Wireframe review</p>
            </div>
            <div>
              <p class="text-xs text-gray-400">9:00 AM</p>
            </div>
          </div>

          <div class="flex items-center justify-between pb-2 mb-2 border-b border-gray-700">
            <div>
              <p class="font-semibold">Zoom call with design team</p>
              <p class="text-xs text-gray-400">Discussion on UX sprint and Wireframe review</p>
            </div>
            <div>
              <p class="text-xs text-gray-400">9:00 AM</p>
            </div>
          </div>

          <div class="flex items-center justify-between pb-2 mb-2 border-b border-gray-700">
            <div>
              <p class="font-semibold">Zoom call with design team</p>
              <p class="text-xs text-gray-400">Discussion on UX sprint and Wireframe review</p>
            </div>
            <div>
              <p class="text-xs text-gray-400">9:00 AM</p>
            </div>
          </div>

          <div class="flex items-center justify-between pb-2 mb-2 border-b border-gray-700">
            <div>
              <p class="font-semibold">Zoom call with design team</p>
              <p class="text-xs text-gray-400">Discussion on UX sprint and Wireframe review</p>
            </div>
            <div>
              <p class="text-xs text-gray-400">9:00 AM</p>
            </div>
          </div>

          <div class="flex items-center justify-between pb-2 mb-2 border-b border-gray-700">
            <div>
              <p class="font-semibold">Zoom call with design team</p>
              <p class="text-xs text-gray-400">Discussion on UX sprint and Wireframe review</p>
            </div>
            <div>
              <p class="text-xs text-gray-400">9:00 AM</p>
            </div>
          </div>

          <div class="flex items-center justify-between pb-2 mb-2 border-b border-gray-700">
            <div>
              <p class="font-semibold">Zoom call with design team</p>
              <p class="text-xs text-gray-400">Discussion on UX sprint and Wireframe review</p>
            </div>
            <div>
              <p class="text-xs text-gray-400">9:00 AM</p>
            </div>
          </div>

          <div class="flex items-center justify-center border-gray-700 cursor-pointer">
            <p class="text-xs text-gray-800">--- More ---</p>
          </div>
        </div>
      </div>
    </div>
    """
  end

  @impl true
  def handle_event("prev_month", _, socket) do
    new_date =
      Date.add(socket.assigns.current_date, -Date.days_in_month(socket.assigns.current_date))

    {:noreply, assign(socket, current_date: new_date)}
  end

  @impl true
  def handle_event("next_month", _, socket) do
    new_date =
      Date.add(socket.assigns.current_date, Date.days_in_month(socket.assigns.current_date))

    {:noreply, assign(socket, current_date: new_date)}
  end

  defp calendar_days(date) do
    first_day_of_month = Date.beginning_of_month(date)
    start_of_week = Date.beginning_of_week(first_day_of_month)
    days = Enum.map(0..41, &Date.add(start_of_week, &1))
    Enum.chunk_every(days, 7)
  end
end
