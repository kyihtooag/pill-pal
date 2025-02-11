defmodule PillPalWeb.Plug.AssignsDefaults do
  use PillPalWeb, :live_view

  def on_mount(:default, _params, %{"current_user" => current_user} = _session, socket) do
    {:cont, assign(socket, current_user: current_user)}
  end
end
