defmodule PillPalWeb.Plug.EnsureLoginTest do
  use PillPalWeb.ConnCase, async: true

  import PillPal.AccountsFixtures

  alias PillPal.Accounts.User
  alias PillPalWeb.Plug.EnsureLogin

  describe "call/2" do
    test "given a current user in session, sets current_user in conn.assigns", %{conn: conn} do
      current_user = user_fixture()

      conn =
        Plug.Test.init_test_session(conn, %{current_user: current_user})

      conn = EnsureLogin.call(conn, [])

      assert %User{} = conn.assigns.current_user
    end

    test "given current_user is not available session, does not set the current_user to conn.assigns",
         %{conn: conn} do
      conn = Plug.Test.init_test_session(conn, %{})

      returned_conn = EnsureLogin.call(conn, [])

      assert Access.get(returned_conn.assigns, :current_user) == nil
    end
  end
end
