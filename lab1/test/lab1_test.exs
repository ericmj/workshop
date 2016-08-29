defmodule Lab1Test do
  use ExUnit.Case
  alias Lab1.Advanced

  test "task2" do
    assert Lab1.task2([1, 2, 3]) == {1, 3}
    assert Lab1.task2([1, 2, 3, 4]) == {1, 3}
    assert Lab1.task2([]) == nil
  end

  test "task3" do
    assert Lab1.task3([1, 2, 3, 4, 5]) == [4, 5]
    assert Lab1.task3([1, 2, 3]) == []
    assert Lab1.task3([]) == []
  end

  test "task4" do
    assert Lab1.task4([]) == 0
    assert Lab1.task4([5]) == 5
    assert Lab1.task4([5, 6, 7]) == 18
  end

  test "advanced task1" do
    assert Advanced.task1([5]) == 5
    assert Advanced.task1([1, 2, 3]) == 1
    assert Advanced.task1([3, 2, 1]) == 1
    assert Advanced.task1([2, 1, 3]) == 1
  end

  test "advanced task2" do
    assert Advanced.task2([5]) == 5
    assert Advanced.task2([5, 5]) == 5
    assert Advanced.task2([5, 6, 7]) == 6
  end

  test "advanced task3" do
    assert Advanced.task3([]) == %{}
    assert Advanced.task3([1]) == %{1 => 1}
    assert Advanced.task3([1, 2, 3]) == %{1 => 1, 2 => 1, 3 => 1}
    assert Advanced.task3([1, 2, 3, 1, 2]) == %{1 => 2, 2 => 2, 3 => 1}
    assert Advanced.task3([1, 1, 1, 1]) == %{1 => 4}
  end
end
