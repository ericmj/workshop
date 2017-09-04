defmodule Lab2Test do
  use ExUnit.Case

  test "task 1: binary_to_list" do
    assert Lab2.binary_to_list(<<1, 2, 3>>) == [1, 2, 3]
    assert Lab2.binary_to_list(<<>>) == []
    assert Lab2.binary_to_list(<<10::16, 300::16>>) == [0, 10, 1, 44]
  end

  test "task 2: num_bits" do
    assert Lab2.num_bits(<<1, 2, 3>>) == 24
    assert Lab2.num_bits(<<>>) == 0
    assert Lab2.num_bits(<<10::16, 300::16>>) == 32
    assert Lab2.num_bits(<<10::4>>) == 4
    assert Lab2.num_bits(<<12::7, 10::4>>) == 11
  end

  test "task 3: double_all" do
    assert Lab2.double_all([]) == []
    assert Lab2.double_all([1, 2, 3]) == [2, 4, 6]
    assert Lab2.double_all([12, 0, -20]) == [24, 0, -40]
    assert Lab2.double_all([42.53]) == [85.06]
  end

  test "task 4: odds_and_evens" do
    assert Lab2.odds_and_evens([]) == {[], []}
    assert Lab2.odds_and_evens([1, 3, 5]) == {[1, 3, 5], []}
    assert Lab2.odds_and_evens([2, 4, 6]) == {[], [2, 4, 6]}
    assert Lab2.odds_and_evens([6, 5, 4, 3, 2, 1]) == {[5, 3, 1], [6, 4, 2]}
  end

  test "task 5: three_largest" do
    assert Lab2.three_largest([]) == []
    assert Lab2.three_largest([4, 9, 6, 3, 1]) == [4, 6, 9]
    assert Lab2.three_largest([-7, 3, 0, 9, 3, 2]) == [3, 3, 9]
    assert Lab2.three_largest([5, -2]) == [-2, 5]
  end

  test "task 6: capitalize_all" do
    assert Lab2.capitalize_all("") == ""
    assert Lab2.capitalize_all("foo bar") == "Foo Bar"
    assert Lab2.capitalize_all("FOO BAR") == "Foo Bar"
    assert Lab2.capitalize_all("elixirconf US  2017") == "Elixirconf Us  2017"
  end

  test "task 7: second_longest" do
    assert Lab2.second_longest("fo bar") == "fo"
    assert Lab2.second_longest("foo ba") == "ba"
    assert Lab2.second_longest("foo ba") == "ba"
    assert Lab2.second_longest("welcome to elixirconf 2017") == "welcome"
    assert Lab2.second_longest("") == nil
  end
end
