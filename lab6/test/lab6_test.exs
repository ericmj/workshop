defmodule Lab6Test do
  use ExUnit.Case
  alias Lab6

  setup do
    %{room: Lab6.new()}
  end

  test "join new member", %{room: room} do
    assert :ok = Lab6.join(room, "Joe")
    assert Lab6.has_member?(room, "Joe")
    refute Lab6.has_member?(room, "Jose")
    assert Lab6.members(room) == ["Joe"]
  end

  test "join existing member", %{room: room} do
    assert :ok =  Lab6.join(room, "Joe")
    assert {:error, _} = Lab6.join(room, "Joe")
  end

  test "leave existing member", %{room: room} do
    assert :ok = Lab6.join(room, "Joe")
    assert :ok = Lab6.leave(room, "Joe")
    refute Lab6.has_member?(room, "Joe")
  end

  test "leave non-existent member", %{room: room} do
    assert {:error, _} = Lab6.leave(room, "Joe")
  end

  test "push message", %{room: room} do
    pid1 = spawn_link(fn ->
      assert :ok = Lab6.join(room, "Joe")
      # Wait until Robert joined
      Process.sleep(100)
      assert :ok = Lab6.send_message(room, "Joe", "Robert", "Hello World")
      # Don't send message to yourself
      refute_receive {:message, "Joe", "Hello World"}
    end)

    pid2 = spawn_link(fn ->
      assert :ok = Lab6.join(room, "Robert")
      # Don't send message to yourself
      assert_receive {:message, "Joe", "Hello World"}
      # Only receive one message
      refute_receive {:message, "Robert", "Hello World"}
    end)

    await_exits([pid1, pid2])
  end

  test "broadcast message", %{room: room} do
    pid1 = spawn_link(fn ->
      assert :ok = Lab6.join(room, "Joe")
      # Wait until Robert joined
      Process.sleep(100)
      assert :ok = Lab6.send_message(room, "Joe", "Robert", "Hello World")
      # Don't send message to yourself
      refute_receive {:message, "Robert", "Hello World"}
    end)

    pid2 = spawn_link(fn ->
      assert :ok = Lab6.join(room, "Robert")
      assert_receive {:message, "Joe", "Hello World"}
      # Only receive one message
      refute_receive {:message, "Robert", "Hello World"}
    end)

    pid3 = spawn_link(fn ->
      assert :ok = Lab6.join(room, "Mike")
      assert_receive {:message, "Joe", "Hello World"}
      # Only receive one message
      refute_receive {:message, "Robert", "Hello World"}
    end)

    await_exits([pid1, pid2, pid3])
  end

  defp await_exits(pids) do
    pids
    |> Enum.map(&{&1, Process.monitor(&1)})
    |> Enum.each(fn {pid, ref} ->
      assert_receive {:DOWN, ^ref, :process, ^pid, :normal}, 100, "No EXIT message received, the process probbably deadlocked"
    end)
  end
end
