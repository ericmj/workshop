defmodule Lab1 do
  def task2([first, _second, third | _rest]) do
    {first, third}
  end

  def task2(_) do
    nil
  end

  def task3([_first, _second, _third | rest]) do
    rest
  end

  def task3(_) do
    []
  end

  def task4([head | tail]) do
    head + task4(tail)
  end

  def task4([]) do
    0
  end

  defmodule Advanced do
    def task1([head|tail]) do
      do_task1(tail, head)
    end

    defp do_task1([head|tail], min) when head < min,
      do: do_task1(tail, head)
    defp do_task1([_head|tail], min),
      do: do_task1(tail, min)
    defp do_task1([], min),
      do: min

    def task2([head|tail]) do
      do_task2(tail, head, 1)
    end

    defp do_task2([head|tail], sum, count) do
      do_task2(tail, head+sum, count+1)
    end

    defp do_task2([], sum, count) do
      sum / count
    end

    def task3(list) do
      do_task3(list, %{})
    end

    defp do_task3([head|tail], map) do
      map = Map.update(map, head, 1, &(&1 + 1))
      do_task3(tail, map)
    end

    defp do_task3([], map) do
      map
    end
  end
end
