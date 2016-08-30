defmodule Lab4Test do
  use ExUnit.Case
  import Lab4
  alias Lab4.Advanced

  defp receive_once do
    receive do
      result -> result
    end
  end

  test "task1" do
    assert task1("Hello") == "Hello"
    assert task1("Bye") == "Bye"
  end

  test "task2" do
    pid = task2()
    send pid, {:sum, self(), 1..2}
    assert receive_once() == 3

    pid = task2()
    send pid, {:sum, self(), 1..10}
    assert receive_once() == 55
  end

  test "task3" do
    assert task3([1..2]) == [3]
    assert task3([1..2, 3..4, 5..6]) == [3, 7, 11]
  end

  test "advanced task1" do
    assert Advanced.task1(1..2) == 3
    assert Advanced.task1(1..10) == 55
  end

  test "advanced task2" do
    assert Advanced.task2([1..2]) == [3]
    assert Advanced.task2([1..2, 3..4, 5..6]) == [3, 7, 11]
  end
end
