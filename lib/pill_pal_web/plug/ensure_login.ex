defmodule PillPalWeb.Plug.EnsureLogin do
  @moduledoc """
  Plug to assign the current user from session to conn's assigns.
  """

  import Plug.Conn
  import Phoenix.Controller, only: [redirect: 2]

  @behaviour Plug

  alias PillPal.Accounts

  @impl Plug
  def init(opts), do: opts

  @impl Plug
  def call(conn, _opts) do
    case get_session(conn, :current_user) do
      nil ->
        conn
        |> redirect(to: "/login")
        |> halt()

      current_user ->
        user = Accounts.get_user_by_email(current_user.email)
        assign(conn, :current_user, user)
    end
  end
end
