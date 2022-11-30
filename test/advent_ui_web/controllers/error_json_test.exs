defmodule AdventUIWeb.ErrorJSONTest do
  use AdventUIWeb.ConnCase, async: true

  test "renders 404" do
    assert AdventUIWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert AdventUIWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
