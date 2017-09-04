defmodule Lab4Test do
  use ExUnit.Case
  import ExUnit.CaptureIO

  defp receive_once do
    receive do
      result -> result
    end
  end

  test "task 1: print_first_message" do
    pid = Lab4.print_first_message()

    assert capture_io(:stderr, fn ->
      send(pid, "foo")
      # Wait until output has been captured
      Process.sleep(100)
    end) == "foo"

    assert capture_io(:stderr, fn ->
      send(pid, "foo")
      # Wait until output has been captured
      Process.sleep(100)
    end) == ""

    refute Process.alive?(pid)
  end

  test "task 2: print_all_messages" do
    pid = Lab4.print_all_messages()

    assert capture_io(:stderr, fn ->
      send(pid, "foo")
      # Wait until output has been captured
      Process.sleep(100)
    end) == "foo"

    assert capture_io(:stderr, fn ->
      send(pid, "bar")
      # Wait until output has been captured
      Process.sleep(100)
    end) == "bar"

    assert Process.alive?(pid)
  end

  test "task 3: sum" do
    pid = Lab4.sum()
    send(pid, {:sum, self(), 1..2})
    assert receive_once() == 3

    pid = Lab4.sum()
    send(pid, {:sum, self(), 1..10})
    assert receive_once() == 55
  end

  test "task 4: sum_all" do
    assert Lab4.sum_all([1..2]) == [3]
    assert Lab4.sum_all([1..2, 3..4, 5..6]) == [3, 7, 11]
  end
end
