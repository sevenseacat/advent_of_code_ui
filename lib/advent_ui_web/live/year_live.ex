defmodule AdventUIWeb.YearLive do
  use AdventUIWeb, :live_view

  import AdventUIWeb.Components.Navigation

  def handle_params(%{"year" => year}, _, socket) do
    {:noreply, assign(socket, year: String.to_integer(year))}
  end

  def render(assigns) do
    ~H"""
    <.with_day_selector {assigns}>
      <h1>--- Stats for <%= @year %> ---</h1>
    </.with_day_selector>
    """
  end
end
