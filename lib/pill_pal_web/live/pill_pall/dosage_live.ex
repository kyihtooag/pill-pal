defmodule PillPalWeb.PillPall.DosageLive do
  @moduledoc """
  Live route for listing coaches.
  """

  use PillPalWeb, :live_view

  # alias PillPal.Dosage

  @impl true
  def mount(_params, _session, socket) do
    socket =
      if connected?(socket) do
        assign(socket, :loading, false)
      else
        assign(socket, :loading, true)
      end

    {:ok, socket}
  end

  @impl true
  def handle_params(_params, _, socket) do
    {:noreply, socket}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="relative z-30 justify-center px-0 overflow-hidden 2xl:px-10">
      <div class="flex items-center w-full mb-4">
        <span class="text-lg font-bold">Dosage Periods</span>
      </div>

      <%!-- Loading Start --%>
      <div :if={@loading} class="flex flex-wrap w-full h-auto overflow-x-auto">
        <div class="w-64 mx-auto mb-3 bg-gray-200 border rounded-lg h-120 loading"></div>
        <div class="w-64 mx-auto mb-3 bg-gray-200 border rounded-lg h-120 loading"></div>
        <div class="w-64 mx-auto mb-3 bg-gray-200 border rounded-lg h-120 loading"></div>
        <div class="w-64 mx-auto mb-3 bg-gray-200 border rounded-lg h-120 loading"></div>
      </div>
      <%!-- Loading End --%>

      <div :if={!@loading} class="flex flex-wrap w-full h-auto overflow-x-auto">
        <div class="flex flex-col justify-between w-auto p-4 mx-auto mb-3 bg-white rounded-lg min-h-120 drop-shadow-lg">
          <div class="flex flex-col items-center mt-1 ml-0 space-y-4 md:ml-4 xl:ml-0">
            <div class="flex flex-col items-center justify-center text-lg font-bold">
              <div>Morning Period</div>
              <div>[ 6:00 AM - 9:00 AM ]</div>
            </div>
            <div class="flex items-center justify-between p-4 bg-white border rounded-lg shadow-md w-60">
              <div class="flex items-center space-x-3">
                <span class="text-lg">Finish project report</span>
              </div>
              <button class="text-gray-500 hover:text-green-700">
                <.icon name="hero-check-circle" class="w-6 h-6" />
              </button>
            </div>

            <div class="flex items-center justify-between p-4 bg-white border rounded-lg shadow-md w-60">
              <div class="flex items-center space-x-3">
                <span class="text-lg">Buy groceries</span>
              </div>
              <button class="text-gray-500 hover:text-green-700">
                <.icon name="hero-check-circle" class="w-6 h-6" />
              </button>
            </div>
          </div>

          <div class="flex items-center justify-between px-3 py-2.5 bg-blue-500 rounded-lg hover:bg-blue-600 w-60">
            <button class="w-full text-white ">
              + Add Ah Hoc Medication
            </button>
          </div>
        </div>
        <div class="flex flex-col justify-between w-auto p-4 mx-auto mb-3 bg-white rounded-lg min-h-120 drop-shadow-lg">
          <div class="flex flex-col items-center mt-1 ml-0 space-y-4 md:ml-4 xl:ml-0">
            <div class="flex flex-col items-center justify-center text-lg font-bold">
              <div>Morning Period</div>
              <div>[ 6:00 AM - 9:00 AM ]</div>
            </div>

            <div class="flex flex-col items-center space-y-4 overflow-auto max-h-80">
              <div class="flex items-center justify-between p-4 bg-white border rounded-lg shadow-md w-60">
                <div class="flex items-center space-x-3">
                  <span class="text-lg">Finish project report</span>
                </div>
                <button class="text-gray-500 hover:text-green-700">
                  <.icon name="hero-check-circle" class="w-6 h-6" />
                </button>
              </div>

              <div class="flex items-center justify-between p-4 bg-white border rounded-lg shadow-md w-60">
                <div class="flex items-center space-x-3">
                  <span class="text-lg">Buy groceries</span>
                </div>
                <button class="text-gray-500 hover:text-green-700">
                  <.icon name="hero-check-circle" class="w-6 h-6" />
                </button>
              </div>

              <div class="flex items-center justify-between p-4 bg-white border rounded-lg shadow-md w-60">
                <div class="flex items-center space-x-3">
                  <span class="text-lg">Buy groceries</span>
                </div>
                <button class="text-gray-500 hover:text-green-700">
                  <.icon name="hero-check-circle" class="w-6 h-6" />
                </button>
              </div>

              <div class="flex items-center justify-between p-4 bg-white border rounded-lg shadow-md w-60">
                <div class="flex items-center space-x-3">
                  <span class="text-lg">Buy groceries</span>
                </div>
                <button class="text-gray-500 hover:text-green-700">
                  <.icon name="hero-check-circle" class="w-6 h-6" />
                </button>
              </div>

              <div class="flex items-center justify-between p-4 bg-white border rounded-lg shadow-md w-60">
                <div class="flex items-center space-x-3">
                  <span class="text-lg">Buy groceries</span>
                </div>
                <button class="text-gray-500 hover:text-green-700">
                  <.icon name="hero-check-circle" class="w-6 h-6" />
                </button>
              </div>

              <div class="flex items-center justify-between p-4 bg-white border rounded-lg shadow-md w-60">
                <div class="flex items-center space-x-3">
                  <span class="text-lg">Buy groceries</span>
                </div>
                <button class="text-gray-500 hover:text-green-700">
                  <.icon name="hero-check-circle" class="w-6 h-6" />
                </button>
              </div>
            </div>
          </div>

          <div class="flex items-center justify-between px-3 py-2.5 bg-blue-500 rounded-lg hover:bg-blue-600 w-60">
            <button class="w-full text-white ">
              + Add Ah Hoc Medication
            </button>
          </div>
        </div>
        <div class="flex flex-col justify-between w-auto p-4 mx-auto mb-3 bg-white rounded-lg min-h-120 drop-shadow-lg">
          <div class="flex flex-col items-center mt-1 ml-0 space-y-4 md:ml-4 xl:ml-0">
            <div class="flex flex-col items-center justify-center text-lg font-bold">
              <div>Morning Period</div>
              <div>[ 6:00 AM - 9:00 AM ]</div>
            </div>
            <div class="flex items-center justify-between p-4 bg-white border rounded-lg shadow-md w-60">
              <div class="flex items-center space-x-3">
                <span class="text-lg">Finish project report</span>
              </div>
              <button class="text-gray-500 hover:text-green-700">
                <.icon name="hero-check-circle" class="w-6 h-6" />
              </button>
            </div>

            <div class="flex items-center justify-between p-4 bg-white border rounded-lg shadow-md w-60">
              <div class="flex items-center space-x-3">
                <span class="text-lg">Buy groceries</span>
              </div>
              <button class="text-gray-500 hover:text-green-700">
                <.icon name="hero-check-circle" class="w-6 h-6" />
              </button>
            </div>
          </div>

          <div class="flex items-center justify-between px-3 py-2.5 bg-blue-500 rounded-lg hover:bg-blue-600 w-60">
            <button class="w-full text-white ">
              + Add Ah Hoc Medication
            </button>
          </div>
        </div>
        <div class="flex flex-col justify-between w-auto p-4 mx-auto mb-3 bg-white rounded-lg min-h-120 drop-shadow-lg">
          <div class="flex flex-col items-center mt-1 ml-0 space-y-4 md:ml-4 xl:ml-0">
            <div class="flex flex-col items-center justify-center text-lg font-bold">
              <div>Morning Period</div>
              <div>[ 6:00 AM - 9:00 AM ]</div>
            </div>
            <div class="flex items-center justify-between p-4 bg-white border rounded-lg shadow-md w-60">
              <div class="flex items-center space-x-3">
                <span class="text-lg">Finish project report</span>
              </div>
              <button class="text-gray-500 hover:text-green-700">
                <.icon name="hero-check-circle" class="w-6 h-6" />
              </button>
            </div>

            <div class="flex items-center justify-between p-4 bg-white border rounded-lg shadow-md w-60">
              <div class="flex items-center space-x-3">
                <span class="text-lg">Buy groceries</span>
              </div>
              <button class="text-gray-500 hover:text-green-700">
                <.icon name="hero-check-circle" class="w-6 h-6" />
              </button>
            </div>
          </div>

          <div class="flex items-center justify-between px-3 py-2.5 bg-blue-500 rounded-lg hover:bg-blue-600 w-60">
            <button class="w-full text-white ">
              + Add Ah Hoc Medication
            </button>
          </div>
        </div>
      </div>
    </div>
    """
  end
end
