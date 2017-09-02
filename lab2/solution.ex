defmodule Lab2 do
  def binary_to_list(<<>>) do
    []
  end
  def binary_to_list(<<byte, rest::binary>>) do
    [byte | binary_to_list(rest)]
  end

  def list_to_binary(list) do
    do_list_to_binary(list, <<>>)
  end

  defp do_list_to_binary([], acc) do
    acc
  end
  defp do_list_to_binary([byte | rest], acc) do
    do_list_to_binary(rest, <<acc::binary, byte>>)
  end

  def num_bits(bitstring) do
    do_num_bits(bitstring, 0)
  end

  defp do_num_bits(<<_bit::1, rest::bitstring>>, count) do
    do_num_bits(bitstring, count + 1)
  end
  defp do_num_bits(<<>>, count) do
    count
  end

  def double_all(list) do
    Enum.map(list, &(&1 + &1))
  end

  def keyword_to_map(keyword) do
    Enum.reduce(keyword, %{}, fn {key, value}, map ->
      Map.put(map, key, value)
    end)
  end

  def odds_and_evens(list) do
    odds = Enum.reject(list, &(rem(&1, 2) == 0))
    evens = Enum.filter(list, &(rem(&1, 2) == 0))
    {odds, evens}
  end

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
