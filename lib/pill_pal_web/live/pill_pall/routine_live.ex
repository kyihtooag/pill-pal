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
    <div class="relative z-30 h-full">
      <div class="flex flex-col w-full h-full space-y-2 lg:flex-row lg:space-x-4">
        <div class="flex flex-col items-center w-full h-full space-y-6">
          <div class="flex flex-col items-center w-auto space-y-5 lg:w-120 ">
            <div class="flex items">
              <span class="text-lg font-bold">Hi Bob</span>
              <button class="px-3 py-1 text-white bg-blue-500 rounded-lg hover:bg-blue-600">
                I'm Feeling...
              </button>
            </div>
          </div>
        </div>
        <div class="flex flex-col items-center w-full h-full space-y-6">
          <div class="flex flex-col items-center w-auto space-y-5 lg:w-80">
            <div class="flex items">
              <span class="text-lg font-bold">Hi Bob</span>
              <button class="px-3 py-1 text-white bg-blue-500 rounded-lg hover:bg-blue-600">
                I'm Feeling...
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
    """
  end
end
