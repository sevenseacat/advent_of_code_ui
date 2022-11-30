defmodule AdventUIWeb.HomeLiveTest do
  use AdventUIWeb.ConnCase, async: true
  import Phoenix.LiveViewTest

  test "renders the tree!", %{conn: conn} do
    {:ok, _live, html} = live(conn, ~p"/")
    assert html =~ "Christmas tree"
  end
end
