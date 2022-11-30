defmodule AdventUIWeb.Components.Navigation do
  use AdventUIWeb, :component

  attr :selected, :integer, default: nil

  def year_selector(assigns) do
    assigns = assign(assigns, years: 2015..DateTime.utc_now().year)

    ~H"""
    <%= for year <- @years do %>
      <.link
        navigate={~p"/#{year}"}
        class="text-green-500 hover:text-green-400 hover:text-shadow shadow-green-400"
      >
        [<span class={if @selected == year, do: "underline underline-offset-4"}><%= year %></span>]
      </.link>
    <% end %>
    """
  end

  attr :year, :integer, required: true
  attr :selected, :integer, default: nil

  def day_selector(assigns) do
    ~H"""
    <%= for day <- 1..25 do %>
      <.link
        navigate={~p"/#{@year}/#{day}"}
        class="text-green-500 hover:text-green-400 hover:text-shadow shadow-green-400"
      >
        [<span class={if @selected == day, do: "underline underline-offset-4"}><%= day %></span>]
      </.link>
    <% end %>
    """
  end
end
