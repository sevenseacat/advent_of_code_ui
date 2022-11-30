defmodule AdventUIWeb.YearLive do
  use AdventUIWeb, :live_view

  def handle_params(%{"year" => year}, _, socket) do
    {:noreply, assign(socket, year: String.to_integer(year))}
  end

  def render(assigns) do
    ~H"""
    <div>
      <h1>--- Stats for <%= @year %> ---</h1>
    </div>
    """
  end
end
