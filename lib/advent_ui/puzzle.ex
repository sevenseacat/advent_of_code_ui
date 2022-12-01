defmodule AdventUI.Puzzle do
  def years, do: 2015..DateTime.utc_now().year

  def count_puzzles() do
    days_unlocked =
      for(year <- years(), day <- 1..25, do: {year, day})
      |> Enum.filter(fn {year, day} -> unlocked?(year, day) end)
      |> Enum.count()

    # 2 puzzles per day
    days_unlocked * 2
  end

  def year_complete?(year) do
    count_complete_puzzles(year) == 50
  end

  def count_complete_puzzles() do
    for(year <- years(), do: count_complete_puzzles(year))
    |> Enum.sum()
  end

  def count_complete_puzzles(year) do
    for(day <- 25..1, part <- [2, 1], do: {day, part})
    |> Enum.filter(fn {day, part} -> complete?(year, day, part) end)
    |> Enum.count()
  end

  # You get the last star only if you have all 49 other stars.
  def complete?(year, 25, 2) do
    for(day <- 25..1, part <- [2, 1], do: {day, part})
    |> tl()
    |> Enum.all?(fn {day, part} -> complete?(year, day, part) end)
  end

  def complete?(year, day, part) do
    # Any completed puzzle will have a function defined like `Y2021.Day01.part1_verify/0`
    module_name = :"Elixir.Y#{year}.Day#{zero_pad(day)}"
    function_name = :"part#{part}_verify"

    Code.ensure_loaded(module_name)
    Kernel.function_exported?(module_name, function_name, 0)
  end

  def unlocked?(year, day) do
    # AOC is in UTC-5, which is New York timezone
    today_aoc = DateTime.now!("America/New_York") |> DateTime.to_date()

    maybe_future_date = Date.from_erl!({year, 12, day})
    Date.compare(maybe_future_date, today_aoc) != :gt
  end

  defp zero_pad(day) when day < 10, do: "0#{day}"
  defp zero_pad(day), do: "#{day}"
end
