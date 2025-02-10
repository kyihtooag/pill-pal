defmodule PillPalWeb.AuthController do
  use PillPalWeb, :controller
  plug Ueberauth

  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, _params) do
    current_user = %{
      name: auth.info.name,
      email: auth.info.email,
      avatar: auth.info.image
    }

    conn
    |> put_session(:current_user, current_user)
    |> put_flash(:info, "Successfully authenticated!")
    |> redirect(to: "/")
  end

  def callback(%{assigns: %{ueberauth_failure: _failure}} = conn, _params) do
    conn
    |> put_flash(:error, "Authentication failed.")
    |> redirect(to: "/")
  end

  def logout(conn, _params) do
    conn
    |> clear_session()
    |> configure_session(drop: true)
    |> redirect(external: "/auth/google")
  end
end
