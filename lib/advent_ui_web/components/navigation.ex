defmodule AdventUIWeb.Components.Navigation do
  use AdventUIWeb, :component

  attr :selected, :integer, default: nil

  def year_selector(assigns) do
    assigns = assign(assigns, years: 2015..DateTime.utc_now().year)

    ~H"""
    <div class="my-4">
      <%= for year <- @years do %>
        <.link
          navigate={~p"/#{year}"}
          class="text-green-500 hover:text-green-400 hover:text-shadow shadow-green-400"
        >
          [<span class={if @selected == year, do: "underline underline-offset-4"}><%= year %></span>]
        </.link>
      <% end %>
    </div>
    """
  end

  attr :year, :integer, required: true
  attr :selected, :integer, default: nil

  def day_selector(assigns) do
    # AOC is in UTC-5, which is New York timezone
    assigns = assign(assigns, aoc_date: DateTime.now!("America/New_York") |> DateTime.to_date())

    ~H"""
    <div class="my-4">
      <%= for day <- 1..25 do %>
        <%= if future?(@year, day, @aoc_date) do %>
          <span class="text-gray-400"><%= day %></span>
        <% else %>
          <.link
            navigate={~p"/#{@year}/#{day}"}
            class="text-green-500 hover:text-green-400 hover:text-shadow shadow-green-400"
          >
            <span class={if @selected == day, do: "underline underline-offset-4"}><%= day %></span>
          </.link>
        <% end %>
      <% end %>
    </div>
    """
  end

  defp future?(year, day, today_aoc) do
    maybe_future_date = Date.from_erl!({year, 12, day})
    Date.compare(maybe_future_date, today_aoc) == :gt
  end
end
