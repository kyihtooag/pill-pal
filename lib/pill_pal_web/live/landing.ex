defmodule PillPalWeb.LandingLive do
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
    <div class="relative z-30">
      <div class="flex flex-col w-full h-full space-y-2 xl:flex-row xl:space-x-4">
        <div class="flex flex-col items-center w-full h-full space-y-6 md:h-auto md:flex-row xl:flex-col md:justify-between xl:justify-normal">
          <div class="flex flex-col items-center w-auto space-y-5 xl:w-120 ">
            <div class="flex items-center justify-between w-full">
              <span class="text-lg font-bold">Hi Bob</span>
              <button class="px-3 py-1 text-white bg-blue-500 rounded-lg hover:bg-blue-600">
                I'm Feeling...
              </button>
            </div>

            <div class="flex md:hidden">
              <.circular_progress_bar
                progress={80}
                radius={120}
                stroke={20}
                text="Hello"
                text_pending={10}
              />
            </div>

            <div class="hidden md:flex">
              <.circular_progress_bar
                progress={80}
                radius={150}
                stroke={20}
                text="Hello"
                text_pending={10}
              />
            </div>
          </div>

          <div class="flex flex-col items-center mt-10 ml-0 space-y-4 md:ml-4 xl:ml-0">
            <div class="flex items-center justify-between p-4 bg-white rounded-lg shadow-md w-80 md:w-96 xl:w-120">
              <div class="flex items-center space-x-3">
                <span class="text-lg">Finish project report</span>
              </div>
              <button class="text-gray-500 hover:text-green-700">
                <.icon name="hero-check-circle" class="w-6 h-6" />
              </button>
            </div>

            <div class="flex items-center justify-between p-4 bg-white rounded-lg shadow-md w-80 md:w-96 xl:w-120">
              <div class="flex items-center space-x-3">
                <span class="text-lg">Buy groceries</span>
              </div>
              <button class="text-gray-500 hover:text-green-700">
                <.icon name="hero-check-circle" class="w-6 h-6" />
              </button>
            </div>

            <div class="flex items-center justify-between p-4 bg-white rounded-lg shadow-md w-80 md:w-96 xl:w-120">
              <div class="flex items-center space-x-3">
                <span class="text-lg">Read a book</span>
              </div>
              <button class="text-gray-500 hover:text-green-700">
                <.icon name="hero-check-circle" class="w-6 h-6" />
              </button>
            </div>

            <div class="flex items-center justify-between p-4 bg-white rounded-lg shadow-md w-80 md:w-96 xl:w-120">
              <div class="flex items-center space-x-3">
                <span class="text-lg">Read a book</span>
              </div>
              <button class="text-gray-500 hover:text-green-700">
                <.icon name="hero-check-circle" class="w-6 h-6 stroke-2" />
              </button>
            </div>

            <div class="flex items-center justify-between px-3 py-2.5 bg-blue-500 rounded-lg hover:bg-blue-600 w-80 md:w-96 xl:w-120">
              <button class="w-full text-white ">
                + Add Ah Hoc Medication
              </button>
            </div>
          </div>
        </div>
        <div class="flex-col items-center hidden w-full h-full space-y-4 xl:flex">
          <div class="p-4 mx-auto bg-white rounded-lg shadow-xl w-120">
            <!-- Header -->
            <div class="flex items-center justify-between mb-3">
              <button
                phx-click="prev_month"
                class="px-2 py-1 text-sm bg-gray-200 rounded hover:bg-gray-300"
              >
                ←
              </button>
              <h2 class="text-lg font-bold">
                {@current_date |> Date.to_string() |> String.slice(0, 7)}
              </h2>
              <button
                phx-click="next_month"
                class="px-2 py-1 text-sm bg-gray-200 rounded hover:bg-gray-300"
              >
                →
              </button>
            </div>

            <div class="grid grid-cols-7 gap-1 text-sm text-center">
              <!-- Weekday Headers -->
              <%= for day <- ~w(Sun Mon Tue Wed Thu Fri Sat) do %>
                <div class="font-semibold text-gray-600">{day}</div>
              <% end %>

              <%= for week <- calendar_days(@current_date) do %>
                <%= for day <- week do %>
                  <div class={"border rounded-lg cursor-pointer #{if Date.compare(day, @current_date) == :eq, do: "bg-blue-200 font-bold", else: "bg-gray-100"}"}>
                    <.circular_progress_bar
                      progress={0}
                      radius={10}
                      stroke={3}
                      font_size={12}
                      text_pending={4}
                      text={to_string(day.day)}
                    />
                  </div>
                <% end %>
              <% end %>
            </div>
          </div>

          <div class="p-4 mt-5 bg-gray-200 w-120">
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
