defmodule PillPalWeb.Components.NavigationHeader do
  @moduledoc """
  Provides navigation UI components.

  """
  use Phoenix.Component
  use Gettext, backend: PillPalWeb.Gettext

  alias Phoenix.LiveView.JS

  @doc """
  Renders a header with title.
  """
  attr :logo_url, :string, required: true
  attr :current_user, :map, required: true
  attr :live_action, :atom, required: true

  def nav_header(assigns) do
    ~H"""
    <div class="sticky top-0 z-50">
      <div class="bg-white rounded-b-lg drop-shadow-lg">
        <div class="container mx-auto" id="header">
          <div class="relative flex items-center justify-between h-16 lg:h-20">
            <div class="flex h-16 lg:h-20">
              <div class="flex items-center shrink-0">
                <a href="/" class="w-32 h-16 lg:w-40 lg:h-20">
                  <img class="object-cover w-full h-full lazyload" src={@logo_url} alt="Logo" />
                </a>
              </div>
              <!-- Start: Desktop menu items -->
              <nav id="desktop-nav-items-component" class="hidden lg:flex lg:grow">
                <ul class="flex" id="mega-nav-header-desktop-menu">
                  <li class="flex flex-col justify-center h-20 mx-3">
                    <a
                      class={[
                        "block py-8 border-transparent cursor-pointer whitespace-nowrap button-text-medium text-gray-700 hover:font-bold hover:text-teal-600",
                        @live_action == :landing && "font-bold text-teal-600"
                      ]}
                      href="/"
                    >
                      Home
                    </a>
                  </li>
                  <li class="flex flex-col justify-center h-20 mx-3">
                    <a
                      class={[
                        "block py-8 border-transparent cursor-pointer whitespace-nowrap button-text-medium text-gray-700 hover:font-bold hover:text-teal-600",
                        @live_action == :dosage && "font-bold text-teal-600"
                      ]}
                      href="/dosage"
                    >
                      Dosage
                    </a>
                  </li>

                  <li class="flex flex-col justify-center h-20 mx-3">
                    <a
                      class={[
                        "block py-8 border-transparent cursor-pointer whitespace-nowrap button-text-medium text-gray-700 hover:font-bold hover:text-teal-600",
                        @live_action == :insights && "font-bold text-teal-600"
                      ]}
                      href="/insights"
                    >
                      Insights
                    </a>
                  </li>
                  <li class="flex flex-col justify-center h-20 mx-3">
                    <a
                      class={[
                        "block py-8 border-transparent cursor-pointer whitespace-nowrap button-text-medium text-gray-700 hover:font-bold hover:text-teal-600",
                        @live_action == :about && "font-bold text-teal-600"
                      ]}
                      href="#"
                    >
                      About us
                    </a>
                  </li>
                </ul>
              </nav>
              <!-- End: Desktop menu items -->
            </div>

            <div class="relative flex items-center self-end h-16 lg:h-20">
              <div
                id="hamburger-menu-mobile"
                phx-click={show_mobile_menu()}
                class="relative p-2 transition duration-300 cursor-pointer group lg:hidden"
              >
                <div
                  id="mobile-first"
                  class="w-6 transition-all duration-300 origin-top-left transform rounded-full bg-gray-500 h-0.5 "
                >
                </div>
                <div
                  id="mobile-second"
                  class="w-6 my-1.5 transition-all duration-300 transform rounded-full bg-gray-500 h-0.5"
                >
                </div>
                <div
                  id="mobile-third"
                  class="w-6 transition-all duration-300 origin-bottom-left transform rounded-full bg-gray-500 h-0.5"
                >
                </div>
              </div>
              <!-- Start: Desktop avatar hover menu -->
              <div id="avatar-hover-component" class="relative items-center hidden lg:flex">
                <div
                  id="user-avatar"
                  class="flex items-center justify-center p-1 overflow-hidden rounded-full shadow-lg"
                >
                  <div class="w-10 h-10 rounded-full bg-cool-grey-200">
                    <img
                      class="object-cover w-full h-full rounded-full lazyload"
                      src={@current_user.avatar}
                      alt="Avatar"
                    />
                  </div>
                </div>
              </div>
              <!-- End: Desktop avatar hover menu -->
            </div>
          </div>
        </div>
      </div>

      <div
        id="mobile-tablet-menu"
        class="absolute inset-x-0 z-50 h-0 overflow-hidden transition-all duration-300 ease-in-out bg-white lg:hidden"
      >
        <div class="flex pb-4 overflow-hidden">
          <div
            id="mobile-main-menu"
            class="w-full transition-all duration-300 ease-out transform shrink-0 grow-0"
          >
            <ul>
              <li class="title-5 text-cool-grey-700">
                <a class="block px-4 py-2 md:px-12 lg:px-30 hover:bg-cool-grey-150" href="#">
                  Home
                </a>
              </li>
              <li class="title-5 text-cool-grey-700">
                <a class="block px-4 py-2 md:px-12 lg:px-30 hover:bg-cool-grey-150" href="#">
                  Routine
                </a>
              </li>
              <li class="title-5 text-cool-grey-700">
                <a class="block px-4 py-2 md:px-12 lg:px-30 hover:bg-cool-grey-150" href="#">
                  Records
                </a>
              </li>
              <li class="title-5 text-cool-grey-700">
                <a class="block px-4 py-2 md:px-12 lg:px-30 hover:bg-cool-grey-150" href="#">
                  About us
                </a>
              </li>

              <div class="h-1"></div>
              <hr class="border-black/[.08]" />
              <div class="h-1"></div>

              <li class="flex items-center justify-between px-4 py-2 cursor-pointer md:px-12 lg:px-30 sub-menu-navigation hover:bg-cool-grey-150">
                <div class="flex items-center">
                  <div class="w-8 h-8 rounded-full bg-cool-grey-200">
                    <img
                      class="object-cover w-full h-full rounded-full avatar-image lazyload"
                      src={@current_user.avatar}
                      alt="Avatar"
                    />
                  </div>
                  <div class="ml-4 title-5 text-cool-grey-700">
                    {@current_user.name}
                  </div>
                </div>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
    """
  end

  defp show_mobile_menu() do
    %JS{}
    |> JS.toggle_class("translate-t rotate-45", to: "#mobile-first")
    |> JS.toggle_class("opacity-0", to: "#mobile-second")
    |> JS.toggle_class("-rotate-45", to: "#mobile-third")
    |> JS.toggle_class("h-0 h-auto drop-shadow-xl rounded-b-lg", to: "#mobile-tablet-menu")
  end
end
