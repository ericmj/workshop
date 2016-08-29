defmodule Tests do
  use ExUnit.Case
  use TrueStory
  import Lab4
  alias Lab4.Advanced

  defp receive_once do
    receive do
      result -> result
    end
  end

  test "task1" do
    assert capture_io(fn -> task1("Hello") end) == "Hello"
    assert capture_io(fn -> task1("Bye") end) == "Bye"
  end

  test "task2" do
    pid = task2()

    send pid, {:sum, self, 1..2}
    assert receive_once() == 3

    send pid, {:sum, self, 1..10}
    assert receive_once() == 45
  end

  test "task3" do
    assert task3([1..2]) == 3
    assert task3([1..2, 3..4, 5..6]) == 21
  end

  test "advanced task1" do
    assert Advanced.task1(1..2) == 3
    assert Advanced.task1(1..10) == 45
  end

  test "advanced task2" do
    assert Advanced.task2([1..2]) == 3
    assert Advanced.task2([1..2, 3..4, 5..6]) == 21
  end
end
