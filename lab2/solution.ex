defmodule Lab2 do
  def count_occurances(list) do
    do_count_occurances(list, %{})
  end

  defp do_count_occurances([head|tail], map) do
    map = Map.update(map, head, 1, &(&1 + 1))
    do_count_occurances(tail, map)
  end
  defp do_count_occurances([], map) do
    map
  end
end
