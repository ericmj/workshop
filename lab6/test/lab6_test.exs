defmodule Lab6Test do
  use ExUnit.Case
  import Lab6
  use TrueStory

  defp start_room(c) do
    {:ok, pid} = start_link()
    assign c, pid: pid
  end

  defp join_room(c, name) do
    join(c.pid, name)
    c
  end

  defp process_join_room(c, name, fun) do
    task = Task.async(fn ->
      join(c.pid, name)
      fun.()
    end)

    assign c, result: Task.await(task)
  end

  defp receive_once do
    receive do
      result -> result
    end
  end

  story "send message to yourself", c
    |> start_room
    |> join_room("Me"),
  verify do
    send_message(c.pid, "Myself", "Me", "echo")
    assert_receive {"Myself", "echo"}
  end

  story "send messages to yourself", c
    |> start_room
    |> join_room("Me"),
  verify do
    send_messages(c.pid, "Myself", "echo")
    assert_receive {"Myself", "echo"}
  end

  story "send message to other process", c
    |> start_room
    |> join_room("John")
    |> process_join_room("Jane", fn -> send_message(c.pid, "Jane", "John", "Hello John") end),
  verify do
    assert_receive {"Jane", "Hello John"}
    assert {"Jane", "Hello John"} == c.result
  end

  story "send messages to other processes", c
    |> start_room
    |> join_room("John")
    |> process_join_room("Jane", fn ->
         send_messages(c.pid, "Jane", "Hello everyone")
         receive_once()
       end),
  verify do
    assert_receive {"Jane", "Hello everyone"}
    assert {"Jane", "Hello everyone"} == c.result
  end
end
