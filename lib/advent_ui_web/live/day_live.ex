defmodule AdventUIWeb.DayLive do
  use AdventUIWeb, :live_view

  import AdventUIWeb.Components.Navigation

  def handle_params(%{"year" => year, "day" => day}, _, socket) do
    {:noreply, assign(socket, year: String.to_integer(year), day: String.to_integer(day))}
  end

  def render(assigns) do
    ~H"""
    <.with_day_selector {assigns}>
      --- Stats for <%= @year %>, day <%= @day %> ---
    </.with_day_selector>
    """
  end
end
