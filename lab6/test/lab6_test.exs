defmodule Lab6Test do
  use ExUnit.Case
  import Lab6

  test "send_message message to yourself" do
    {:ok, pid} = start_link()
    join(pid, "Me")
    send_message(pid, "Myself", "Me", "echo")

    assert_receive {"Myself", "echo"}
  end

  test "send_messages message to yourself" do
    {:ok, pid} = start_link()
    join(pid, "Me")
    send_messages(pid, "Myself", "echo")

    assert_receive {"Myself", "echo"}
  end

  test "send_message message to other process" do
    {:ok, pid} = start_link()
    join(pid, "John")

    spawn_link(fn ->
      join(pid, "Jane")
      send_message(pid, "Jane", "John", "Hello John")
    end)

    assert_receive {"Jane", "Hello John"}
  end

  test "send_messages message to all processes" do
    {:ok, pid} = start_link()
    join(pid, "John")

    spawn_link(fn ->
      join(pid, "Jane")
      send_messages(pid, "Jane","Hello John")
      assert_receive {"Jane", "Hello John"}
    end)

    assert_receive {"Jane", "Hello John"}
  end
end
