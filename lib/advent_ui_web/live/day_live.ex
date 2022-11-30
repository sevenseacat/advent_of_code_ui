defmodule AdventUIWeb.DayLive do
  use AdventUIWeb, :live_view

  def handle_params(%{"year" => year, "day" => day}, _, socket) do
    {:noreply, assign(socket, year: String.to_integer(year), day: String.to_integer(day))}
  end

  def render(assigns) do
    ~H"""
    <div>
      --- Stats for <%= @year %>, day <%= @day %> ---
    </div>
    """
  end
end
