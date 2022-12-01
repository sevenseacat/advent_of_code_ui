defmodule AdventUIWeb.Components.Navigation do
  use AdventUIWeb, :component

  alias AdventUI.Puzzle

  attr :selected, :integer, default: nil

  def year_selector(assigns) do
    ~H"""
    <div class="my-4">
      <.link
        :for={year <- Puzzle.years()}
        navigate={~p"/#{year}"}
        class={[
          link_classes(@selected == year),
          "inline-block text-center mr-4 leading-snug",
          if(Puzzle.year_complete?(year), do: "font-bold")
        ]}
      >
        [<span class={}><%= year %></span>]<br />
        <span class="text-base">
          <%= Puzzle.count_complete_puzzles(year) %> <.star filled={true} size="small" />
        </span>
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
    ~H"""
    <div>
      <.day :for={day <- 1..25} year={@year} day={day} selected={@selected} />
    </div>
    """
  end

  defp day(assigns) do
    ~H"""
    <div class="text-right">
      <%= if !Puzzle.unlocked?(@year, @day) do %>
        <span class="text-gray-400"><%= @day %></span>
        <.no_star /><.no_star />
      <% else %>
        <.link navigate={~p"/#{@year}/#{@day}"} class={link_classes(@selected == @day)}>
          <%= @day %>
        </.link>
        <.puzzle_star year={@year} day={@day} part={1} /><.puzzle_star
          year={@year}
          day={@day}
          part={2}
        />
      <% end %>
    </div>
    """
  end

  defp puzzle_star(assigns) do
    ~H"""
    <.star filled={Puzzle.complete?(@year, @day, @part)} />
    """
  end

  defp link_classes(true), do: "text-white shadow-white text-shadow"

  defp link_classes(_) do
    "text-green-500 shadow-green-400 hover:text-shadow hover:text-green-400"
  end
end
