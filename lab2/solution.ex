defmodule Lab2 do
  def binary_to_list(<<>>) do
    []
  end
  def binary_to_list(<<byte, rest::binary>>) do
    [byte | binary_to_list(rest)]
  end

  def num_bits(bitstring) do
    do_num_bits(bitstring, 0)
  end

  defp do_num_bits(<<_bit::1, rest::bitstring>>, count) do
    do_num_bits(rest, count + 1)
  end
  defp do_num_bits(<<>>, count) do
    count
  end

  def double_all(list) do
    Enum.map(list, &(&1 + &1))
  end

  def odds_and_evens(list) do
    odds = Enum.reject(list, &(rem(&1, 2) == 0))
    evens = Enum.filter(list, &(rem(&1, 2) == 0))
    {odds, evens}
  end

  def three_largest(list) do
    list
    |> Enum.sort(&>=/2)
    |> Enum.take(3)
    |> Enum.sort(&<=/2)
  end

  def capitalize_all(string) do
    string
    |> String.split(" ")
    |> Enum.map(&String.capitalize/1)
    |> Enum.join(" ")
  end

  def second_longest(string) do
    string
    |> String.split(" ")
    |> Enum.map(&{&1, String.length(&1)})
    |> Enum.sort_by(fn {_string, length} -> length end, &>=/2)
    |> Enum.at(1, {nil, 0})
    |> elem(0)
  end
end
