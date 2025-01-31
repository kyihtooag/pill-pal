defmodule PillPalWeb.Plug.AssignsDefaults do
  use PillPalWeb, :live_view

  def on_mount(:default, _params, _session, socket) do
    {:cont, socket}
  end
end
