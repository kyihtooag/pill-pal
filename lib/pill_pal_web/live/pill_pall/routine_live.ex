defmodule PillPalWeb.PillPall.RoutineLive do
  @moduledoc """
  Live route for listing coaches.
  """

  use PillPalWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
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
      <div class="flex items-center w-full">
        <span class="text-lg font-bold">Sessions</span>
      </div>

      <div class="flex flex-row justify-between">
        <div class="flex flex-wrap w-full h-auto my-3 space-x-0 space-y-10 overflow-x-auto xl:flex-row xl:space-x-4 xl:space-y-0">
          <div class="flex flex-col w-auto p-4 mx-auto bg-white rounded-lg drop-shadow-lg">
            <div class="flex flex-col items-center justify-center text-lg font-bold">
              <div>Morning Session</div>
              <div>[ 6:00 AM - 9:00 AM ]</div>
            </div>

            <div class="flex flex-col items-center mt-10 ml-0 space-y-4 md:ml-4 xl:ml-0">
              <div class="flex items-center justify-between p-4 bg-white rounded-lg shadow-md w-60">
                <div class="flex items-center space-x-3">
                  <span class="text-lg">Finish project report</span>
                </div>
                <button class="text-gray-500 hover:text-green-700">
                  <.icon name="hero-check-circle" class="w-6 h-6" />
                </button>
              </div>

              <div class="flex items-center justify-between p-4 bg-white rounded-lg shadow-md w-60">
                <div class="flex items-center space-x-3">
                  <span class="text-lg">Buy groceries</span>
                </div>
                <button class="text-gray-500 hover:text-green-700">
                  <.icon name="hero-check-circle" class="w-6 h-6" />
                </button>
              </div>

              <div class="flex items-center justify-between p-4 bg-white rounded-lg shadow-md w-60">
                <div class="flex items-center space-x-3">
                  <span class="text-lg">Read a book</span>
                </div>
                <button class="text-gray-500 hover:text-green-700">
                  <.icon name="hero-check-circle" class="w-6 h-6" />
                </button>
              </div>

              <div class="flex items-center justify-between p-4 bg-white rounded-lg shadow-md w-60">
                <div class="flex items-center space-x-3">
                  <span class="text-lg">Read a book</span>
                </div>
                <button class="text-gray-500 hover:text-green-700">
                  <.icon name="hero-check-circle" class="w-6 h-6 stroke-2" />
                </button>
              </div>

              <div class="flex items-center justify-between px-3 py-2.5 bg-blue-500 rounded-lg hover:bg-blue-600 w-60">
                <button class="w-full text-white ">
                  + Add Ah Hoc Medication
                </button>
              </div>
            </div>
          </div>
          <div class="flex flex-col w-auto p-4 mx-auto bg-white rounded-lg drop-shadow-lg">
            <div class="flex flex-col items-center justify-center text-lg font-bold">
              <div>Morning Session</div>
              <div>[ 6:00 AM - 9:00 AM ]</div>
            </div>

            <div class="flex flex-col items-center mt-10 ml-0 space-y-4 md:ml-4 xl:ml-0">
              <div class="flex items-center justify-between p-4 bg-white rounded-lg shadow-md w-60">
                <div class="flex items-center space-x-3">
                  <span class="text-lg">Finish project report</span>
                </div>
                <button class="text-gray-500 hover:text-green-700">
                  <.icon name="hero-check-circle" class="w-6 h-6" />
                </button>
              </div>

              <div class="flex items-center justify-between p-4 bg-white rounded-lg shadow-md w-60">
                <div class="flex items-center space-x-3">
                  <span class="text-lg">Buy groceries</span>
                </div>
                <button class="text-gray-500 hover:text-green-700">
                  <.icon name="hero-check-circle" class="w-6 h-6" />
                </button>
              </div>

              <div class="flex items-center justify-between p-4 bg-white rounded-lg shadow-md w-60">
                <div class="flex items-center space-x-3">
                  <span class="text-lg">Read a book</span>
                </div>
                <button class="text-gray-500 hover:text-green-700">
                  <.icon name="hero-check-circle" class="w-6 h-6" />
                </button>
              </div>

              <div class="flex items-center justify-between p-4 bg-white rounded-lg shadow-md w-60">
                <div class="flex items-center space-x-3">
                  <span class="text-lg">Read a book</span>
                </div>
                <button class="text-gray-500 hover:text-green-700">
                  <.icon name="hero-check-circle" class="w-6 h-6 stroke-2" />
                </button>
              </div>

              <div class="flex items-center justify-between px-3 py-2.5 bg-blue-500 rounded-lg hover:bg-blue-600 w-60">
                <button class="w-full text-white ">
                  + Add Ah Hoc Medication
                </button>
              </div>
            </div>
          </div>
          <div class="flex flex-col w-auto p-4 mx-auto bg-white rounded-lg drop-shadow-lg">
            <div class="flex flex-col items-center justify-center text-lg font-bold">
              <div>Morning Session</div>
              <div>[ 6:00 AM - 9:00 AM ]</div>
            </div>

            <div class="flex flex-col items-center mt-10 ml-0 space-y-4 md:ml-4 xl:ml-0">
              <div class="flex items-center justify-between p-4 bg-white rounded-lg shadow-md w-60">
                <div class="flex items-center space-x-3">
                  <span class="text-lg">Finish project report</span>
                </div>
                <button class="text-gray-500 hover:text-green-700">
                  <.icon name="hero-check-circle" class="w-6 h-6" />
                </button>
              </div>

              <div class="flex items-center justify-between p-4 bg-white rounded-lg shadow-md w-60">
                <div class="flex items-center space-x-3">
                  <span class="text-lg">Buy groceries</span>
                </div>
                <button class="text-gray-500 hover:text-green-700">
                  <.icon name="hero-check-circle" class="w-6 h-6" />
                </button>
              </div>

              <div class="flex items-center justify-between p-4 bg-white rounded-lg shadow-md w-60">
                <div class="flex items-center space-x-3">
                  <span class="text-lg">Read a book</span>
                </div>
                <button class="text-gray-500 hover:text-green-700">
                  <.icon name="hero-check-circle" class="w-6 h-6" />
                </button>
              </div>

              <div class="flex items-center justify-between p-4 bg-white rounded-lg shadow-md w-60">
                <div class="flex items-center space-x-3">
                  <span class="text-lg">Read a book</span>
                </div>
                <button class="text-gray-500 hover:text-green-700">
                  <.icon name="hero-check-circle" class="w-6 h-6 stroke-2" />
                </button>
              </div>

              <div class="flex items-center justify-between px-3 py-2.5 bg-blue-500 rounded-lg hover:bg-blue-600 w-60">
                <button class="w-full text-white ">
                  + Add Ah Hoc Medication
                </button>
              </div>
            </div>
          </div>
          <div class="flex flex-col w-auto p-4 mx-auto bg-white rounded-lg drop-shadow-lg">
            <div class="flex flex-col items-center justify-center text-lg font-bold">
              <div>Morning Session</div>
              <div>[ 6:00 AM - 9:00 AM ]</div>
            </div>

            <div class="flex flex-col items-center mt-10 ml-0 space-y-4 md:ml-4 xl:ml-0">
              <div class="flex items-center justify-between p-4 bg-white rounded-lg shadow-md w-60">
                <div class="flex items-center space-x-3">
                  <span class="text-lg">Finish project report</span>
                </div>
                <button class="text-gray-500 hover:text-green-700">
                  <.icon name="hero-check-circle" class="w-6 h-6" />
                </button>
              </div>

              <div class="flex items-center justify-between p-4 bg-white rounded-lg shadow-md w-60">
                <div class="flex items-center space-x-3">
                  <span class="text-lg">Buy groceries</span>
                </div>
                <button class="text-gray-500 hover:text-green-700">
                  <.icon name="hero-check-circle" class="w-6 h-6" />
                </button>
              </div>

              <div class="flex items-center justify-between p-4 bg-white rounded-lg shadow-md w-60">
                <div class="flex items-center space-x-3">
                  <span class="text-lg">Read a book</span>
                </div>
                <button class="text-gray-500 hover:text-green-700">
                  <.icon name="hero-check-circle" class="w-6 h-6" />
                </button>
              </div>

              <div class="flex items-center justify-between p-4 bg-white rounded-lg shadow-md w-60">
                <div class="flex items-center space-x-3">
                  <span class="text-lg">Read a book</span>
                </div>
                <button class="text-gray-500 hover:text-green-700">
                  <.icon name="hero-check-circle" class="w-6 h-6 stroke-2" />
                </button>
              </div>

              <div class="flex items-center justify-between px-3 py-2.5 bg-blue-500 rounded-lg hover:bg-blue-600 w-60">
                <button class="w-full text-white ">
                  + Add Ah Hoc Medication
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    """
  end
end
