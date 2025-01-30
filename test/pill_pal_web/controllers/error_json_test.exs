defmodule PillPalWeb.ErrorJSONTest do
  use PillPalWeb.ConnCase, async: true

  test "renders 404" do
    assert PillPalWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert PillPalWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
