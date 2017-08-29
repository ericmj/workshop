defmodule Lab1Test do
  use ExUnit.Case

  test "task 1: first_and_third" do
    assert Lab1.first_and_third([1, 2, 3]) == {1, 3}
    assert Lab1.first_and_third([1, 2, 3, 4]) == {1, 3}
    assert Lab1.first_and_third([]) == nil
  end

  test "task 2: drop_three" do
    assert Lab1.drop_three([1, 2, 3, 4, 5]) == [4, 5]
    assert Lab1.drop_three([1, 2, 3]) == []
    assert Lab1.drop_three([]) == []
  end

  test "task 3: sum" do
    assert Lab1.sum([]) == 0
    assert Lab1.sum([5]) == 5
    assert Lab1.sum([5, 6, 7]) == 18
  end

  test "task 4: sum_fun" do
    assert Lab1.sum_fun().([]) == 0
    assert Lab1.sum_fun().([5]) == 5
    assert Lab1.sum_fun().([5, 6, 7]) == 18
  end

  test "task 5: min" do
    assert Lab1.min([5]) == 5
    assert Lab1.min([1, 2, 3]) == 1
    assert Lab1.min([3, 2, 1]) == 1
    assert Lab1.min([2, 1, 3]) == 1
  end

  test "task 6: average" do
    assert Lab1.average([5]) == 5
    assert Lab1.average([5, 5]) == 5
    assert Lab1.average([5, 6, 7]) == 6
  end
end
