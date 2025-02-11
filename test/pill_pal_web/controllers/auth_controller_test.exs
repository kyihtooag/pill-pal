defmodule PillPalWeb.PageControllerTest do
  use PillPalWeb.ConnCase

  import PillPal.AccountsFixtures

  test "redirect to login page if the user haven't login", %{conn: conn} do
    conn = get(conn, ~p"/")
    assert redirected_to(conn) == "/login"
  end

  test "logging out will create the session and redirect to login page", %{conn: conn} do
    user = user_fixture()

    conn =
      conn
      |> put_session_user(user: user)
      |> get(~p"/logout")

    assert redirected_to(conn) == "/login"
    assert get_session(conn, :current_user) == nil
  end
end
