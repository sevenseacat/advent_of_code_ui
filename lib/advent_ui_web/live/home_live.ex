defmodule AdventUIWeb.HomeLive do
  use AdventUIWeb, :live_view

  import AdventUIWeb.Components.Tree

  def render(assigns) do
    ~H"""
    <div>
      <p>It's the Advent of Code LiveView UI project!</p>
      <.tree />
    </div>
    """
  end
end
