defmodule AdventUIWeb.YearLive do
  use AdventUIWeb, :live_view

  import AdventUIWeb.Components.Navigation

  def handle_params(%{"year" => year}, _, socket) do
    {:noreply, assign(socket, year: String.to_integer(year))}
  end

  def render(assigns) do
    ~H"""
    <div>
      <.day_selector year={@year} />
      <p>Stats about the year will go here</p>
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
