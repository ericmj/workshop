defmodule Lab4Test do
  use ExUnit.Case
  alias Lab4.Advanced
  import ExUnit.CaptureIO

  defp receive_once do
    receive do
      result -> result
    end
  end

  test "task 1: print_first_message" do
    pid = print_first_message()

    assert capture_io(:stdout, fn ->
      send(pid, "foo")
      Process.sleep(100)
    end) == "foo"

    assert capture_io(:stdout, fn ->
      send(pid, "foo")
      Process.sleep(100)
    end) == ""

    refure Process.alive?(pid)
  end

  test "task 2: print_all_messages" do
    pid = print_all_messages()

    assert capture_io(:stdout, fn ->
      send(pid, "foo")
      Process.sleep(100)
    end) == "foo"

    assert capture_io(:stdout, fn ->
      send(pid, "bar")
      Process.sleep(100)
    end) == "bar"

    assert Process.alive?(pid)
  end

  test "task 3: sum" do
    pid = sum()
    send(pid, {:sum, self(), 1..2})
    assert receive_once() == 3

    pid = sum()
    send(pid, {:sum, self(), 1..10})
    assert receive_once() == 55
  end

  test "task 4: sum_all" do
    assert sum_all([1..2]) == [3]
    assert sum_all([1..2, 3..4, 5..6]) == [3, 7, 11]
  end
  end
end
