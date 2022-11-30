defmodule AdventUIWeb.Components.Navigation do
  use AdventUIWeb, :component

  alias AdventUI.Puzzle

  attr :selected, :integer, default: nil

  def year_selector(assigns) do
    assigns = assign(assigns, years: 2015..DateTime.utc_now().year)

    ~H"""
    <div class="my-4">
      <.link :for={year <- @years} navigate={~p"/#{year}"} class={link_classes(@selected == year)}>
        [<span class={}><%= year %></span>]
      </.link>
    </div>
    """
  end

  def with_day_selector(assigns) do
    ~H"""
    <div class="grid grid-cols-[10%_auto]">
      <.day_selector year={assigns[:year]} selected={assigns[:day]} />
      <div class="ml-8">
        <div class="mb-4">
          <%= render_slot(@inner_block) %>
        </div>

        <.home_link />
      </div>
    </div>
    """
  end

  attr :year, :integer, required: true
  attr :selected, :integer, default: nil

  def day_selector(assigns) do
    # AOC is in UTC-5, which is New York timezone
    assigns = assign(assigns, aoc_date: DateTime.now!("America/New_York") |> DateTime.to_date())

    ~H"""
    <div>
      <.day :for={day <- 1..25} year={@year} day={day} aoc_date={@aoc_date} selected={@selected} />
    </div>
    """
  end

  defp day(assigns) do
    ~H"""
    <div class="text-right">
      <%= if future?(@year, @day, @aoc_date) do %>
        <span class="text-gray-400"><%= @day %></span>
        <.no_star />
        <.no_star />
      <% else %>
        <.link navigate={~p"/#{@year}/#{@day}"} class={link_classes(@selected == @day)}>
          <%= @day %>
        </.link>
        <.star year={@year} day={@day} part={1} />
        <.star year={@year} day={@day} part={2} />
      <% end %>
    </div>
    """
  end

  defp star(assigns) do
    assigns = assign(assigns, complete: Puzzle.complete?(assigns.year, assigns.day, assigns.part))

    ~H"""
    <Heroicons.star
      solid={@complete}
      class={[
        "w-4 h-4 inline",
        if(@complete, do: "text-yellow-300", else: "text-gray-400")
      ]}
    />
    """
  end

  defp no_star(assigns) do
    ~H"""
    <span class="w-4 h-4 inline-block text-gray-400 text-center">.</span>
    """
  end

  defp link_classes(true), do: "text-white shadow-white text-shadow"

  defp link_classes(_) do
    "text-green-500 shadow-green-400 hover:text-shadow hover:text-green-400"
  end

  defp future?(year, day, today_aoc) do
    maybe_future_date = Date.from_erl!({year, 12, day})
    Date.compare(maybe_future_date, today_aoc) == :gt
  end
end
