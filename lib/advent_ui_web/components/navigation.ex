defmodule AdventUIWeb.Components.Navigation do
  use AdventUIWeb, :component

  def year_selector(assigns) do
    assigns = assign(assigns, years: 2015..DateTime.utc_now().year)

    ~H"""
    <%= for year <- @years do %>
      <.link navigate={~p"/#{year}"} class="text-green-500 hover:text-shadow shadow-green-500">
        [<%= year %>]
      </.link>
    <% end %>
    """
  end
end
