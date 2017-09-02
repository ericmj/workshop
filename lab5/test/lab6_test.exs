defmodule Lab6Test do
  use ExUnit.Case
  alias Lab6
  use TrueStory

  defp start_room(c) do
    {:ok, pid} = Lab6.start_link()
    assign c, pid: pid
  end

  defp join_room(c, name) do
    Lab6.join(c.pid, name)
    c
  end

  defp process_join_room(c, name, fun) do
    task = Task.async(fn ->
      Lab6.join(c.pid, name)
      fun.()
    end)

    assign c, result: Task.await(task)
  end

  defp send_message(c, from, to, message) do
    result = Lab6.send_message(c.pid, from, to, message)
    assign c, send_result: result
  end

  defp send_messages(c, from, message) do
    result = Lab6.send_messages(c.pid, from, message)
    assign c, send_result: result
  end

  defp receive_once do
    receive do
      result -> result
    end
  end

  story "send message to yourself", c
    |> start_room
    |> join_room("Me")
    |> send_message("Myself", "Me", "echo"),
  verify do
    assert_receive {"Myself", "echo"}
    assert {"Myself", "echo"} == c.send_result
  end

  story "send messages to yourself", c
    |> start_room
    |> join_room("Me")
    |> send_messages("Myself", "echo"),
  verify do
    assert_receive {"Myself", "echo"}
    assert [{"Myself", "echo"}] == c.send_result
  end

  story "send message to other process", c
    |> start_room
    |> join_room("John")
    |> process_join_room("Jane", fn -> Lab6.send_message(c.pid, "Jane", "John", "Hello John") end),
  verify do
    assert_receive {"Jane", "Hello John"}
    assert {"Jane", "Hello John"} == c.result
  end

  story "send messages to other processes", c
    |> start_room
    |> join_room("John")
    |> process_join_room("Jane", fn ->
         Lab6.send_messages(c.pid, "Jane", "Hello everyone")
         receive_once()
       end),
  verify do
    assert_receive {"Jane", "Hello everyone"}
    assert {"Jane", "Hello everyone"} == c.result
  end
end
