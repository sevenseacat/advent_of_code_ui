defmodule AdventUIWeb.DayLive do
  use AdventUIWeb, :live_view

  import AdventUIWeb.Components.Navigation

  def handle_params(%{"year" => year, "day" => day}, _, socket) do
    {:noreply, assign(socket, year: String.to_integer(year), day: String.to_integer(day))}
  end

  def render(assigns) do
    ~H"""
    <div>
      <.day_selector year={@year} selected={@day} />
      <p>Stats about the day will go here</p>
      <p>
        <.link
          navigate={~p"/"}
          class="text-green-500 hover:text-green-400 hover:text-shadow shadow-green-400"
        >
          [Home]
        </.link>
      </p>
    </div>
    """
  end
end
