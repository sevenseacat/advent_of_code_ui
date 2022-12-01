defmodule AdventUIWeb.HomeLive do
  use AdventUIWeb, :live_view

  import AdventUIWeb.Components.Tree
  alias AdventUI.Puzzle

  def render(assigns) do
    ~H"""
    <div>
      <p>It's the Advent of Code LiveView UI project!</p>
      <p class="font-bold text-2xl">
        Stars complete: <%= Puzzle.count_complete_puzzles() %> / <%= Puzzle.count_puzzles() %>
        <.star size="large" />
      </p>
      <.tree />
    </div>
    """
  end
end
