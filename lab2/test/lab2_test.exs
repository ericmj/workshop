defmodule Lab2Test do
  use ExUnit.Case

  test "task 1: binary_to_list" do
    assert Lab2.binary_to_list(<<1, 2, 3>>) == [1, 2, 3]
    assert Lab2.binary_to_list(<<>>) == []
    assert Lab2.binary_to_list(<<10::16, 300::16>>) == [0, 10, 1, 44]
  end

  test "task 2: list_to_binary" do
    assert Lab2.list_to_binary([1, 2, 3]) == <<1, 2, 3>>
    assert Lab2.list_to_binary([]) == <<>>
    assert Lab2.list_to_binary([0, 10, 1, 44]) == <<0, 10, 1, 44>>
  end

  test "task 3: num_bits" do
    assert Lab2.num_bits(<<1, 2, 3>>) == 24
    assert Lab2.num_bits(<<>>) == 0
    assert Lab2.num_bits(<<10::16, 300::16>>) == 32
    assert Lab2.num_bits(<<10::4>>) == 4
    assert Lab2.num_bits(<<12::7, 10::4>>) == 11
  end

  test "task 4: double_all" do
    assert Lab2.double_all([]) == []
    assert Lab2.double_all([1, 2, 3]) == [2, 4, 6]
    assert Lab2.double_all([12, 0, -20]) == [24, 0, -40]
    assert Lab2.double_all([42.53]) == [85.06]
  end

  test "task 5: keyword_to_map" do
    assert Lab2.keyword_to_map([]) == %{}
    assert Lab2.keyword_to_map([foo: :bar]) == %{foo: :bar}
    assert Lab2.keyword_to_map([a: 0, b: 1, c: 2]) == %{a: 0, b: 1, c: 2}
  end

  test "task 6: odds_and_evens" do
    assert Lab2.odds_and_evens([]) == {[], []}
    assert Lab2.odds_and_evens([1, 3, 5]) == {[1, 3, 5], []}
    assert Lab2.odds_and_evens([2, 4, 6]) == {[], [2, 4, 6]}
    assert Lab2.odds_and_evens([6, 5, 4, 3, 2, 1]) == {[5, 3, 1], [6, 4, 2]}
  end

  test "task 7: count_occurances" do
    assert Lab2.count_occurances([]) == %{}
    assert Lab2.count_occurances([:foo]) == %{:foo => 1}
    assert Lab2.count_occurances([:foo, :bar, :baz]) == %{:foo => 1, :bar => 1, :baz => 1}
    assert Lab2.count_occurances([:foo, :bar, :baz, :foo, :bar]) == %{:foo => 2, :bar => 2, :baz => 1}
    assert Lab2.count_occurances([:foo, :foo, :foo, :foo]) == %{:foo => 4}
  end
end
