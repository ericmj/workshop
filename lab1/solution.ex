defmodule Lab1 do
  def first_and_third([first, _second, third | _rest]) do
    {first, third}
  end
  def first_and_third(_) do
    nil
  end

  def drop_three([_first, _second, _third | rest]) do
    rest
  end
  def drop_three(_) do
    []
  end

  def sum([head | tail]) do
    head + task4(tail)
  end
  def sum([]) do
    0
  end

  def min([head|tail]) do
    do_min(tail, head)
  end

  defp do_min([head|tail], min) when head < min,
    do: do_min(tail, head)
  defp do_min([_head|tail], min),
    do: do_min(tail, min)
  defp do_min([], min),
    do: min

  def average([head|tail]) do
    do_average(tail, head, 1)
  end

  defp do_average([head|tail], sum, count) do
    do_average(tail, head+sum, count+1)
  end
  defp do_average([], sum, count) do
    sum / count
  end
end
