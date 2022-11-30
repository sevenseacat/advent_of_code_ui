defmodule AdventUI.Puzzle do
  def complete?(year, day, part) do
    # Any completed puzzle will have a function defined like `Y2021.Day01.part1_verify/0`
    module_name = :"Elixir.Y#{year}.Day#{zero_pad(day)}"
    function_name = :"part#{part}_verify"

    Code.ensure_loaded(module_name)
    Kernel.function_exported?(module_name, function_name, 0)
  end

  defp zero_pad(day) when day < 10, do: "0#{day}"
  defp zero_pad(day), do: "#{day}"
end
