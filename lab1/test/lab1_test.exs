defmodule Lab1Test do
  use ExUnit.Case

  @tag :skip
  test "task 2: first_and_third" do
    assert Lab1.first_and_third([1, 2, 3]) == {1, 3}
    assert Lab1.first_and_third([1, 2, 3, 4]) == {1, 3}
    assert Lab1.first_and_third([]) == nil
  end

  @tag :skip
  test "task 3: drop_three" do
    assert Lab1.drop_three([1, 2, 3, 4, 5]) == [4, 5]
    assert Lab1.drop_three([1, 2, 3]) == []
    assert Lab1.drop_three([]) == []
  end

  @tag :skip
  test "task 4: sum" do
    assert Lab1.sum([]) == 0
    assert Lab1.sum([5]) == 5
    assert Lab1.sum([5, 6, 7]) == 18
  end

  @tag :skip
  test "task 5: min" do
    assert Lab1.min([5]) == 5
    assert Lab1.min([1, 2, 3]) == 1
    assert Lab1.min([3, 2, 1]) == 1
    assert Lab1.min([2, 1, 3]) == 1
    assert Lab1.min([1, -1, 0]) == -3
  end

  @tag :skip
  test "task 6: average" do
    assert Lab1.average([5]) == 5
    assert Lab1.average([5, 5]) == 5
    assert Lab1.average([5, 6, 7]) == 6
    assert Lab1.average([]) == nil
  end
end
