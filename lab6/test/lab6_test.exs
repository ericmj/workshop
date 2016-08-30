defmodule Lab6Test do
  use ExUnit.Case
  import Lab6

  test "send message to yourself" do
    {:ok, pid} = start_link()
    join(pid, "Me")
    send(pid, "Myself", "Me", "echo")

    assert_receive {"Myself", "echo"}
  end

  test "broadcast message to yourself" do
    {:ok, pid} = start_link()
    join(pid, "Me")
    broadcast(pid, "Myself", "echo")

    assert_receive {"Myself", "echo"}
  end

  test "send message to other process" do
    {:ok, pid} = start_link()
    join(pid, "John")

    spawn_link(fn ->
      join(pid, "Jane")
      send(pid, "Jane", "John", "Hello John")
    end)

    assert_receive {"Jane", "Hello John"}
  end

  test "broadcast message to all processes" do
    {:ok, pid} = start_link()
    join(pid, "John")

    spawn_link(fn ->
      join(pid, "Jane")
      broadcast(pid, "Jane","Hello John")
      assert_receive {"Jane", "Hello John"}
    end)

    assert_receive {"Jane", "Hello John"}
  end
end
