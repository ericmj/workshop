defmodule Lab5Test do
  use ExUnit.Case
  alias Lab5

  setup do
    %{room: Lab5.new()}
  end

  test "join new member", %{room: room} do
    assert :ok = Lab5.join(room, "Joe")
    assert Lab5.has_member?(room, "Joe")
    refute Lab5.has_member?(room, "Jose")
    assert Lab5.members(room) == ["Joe"]
  end

  test "join existing member", %{room: room} do
    assert :ok =  Lab5.join(room, "Joe")
    assert {:error, _} = Lab5.join(room, "Joe")
  end

  test "leave existing member", %{room: room} do
    assert :ok = Lab5.join(room, "Joe")
    assert :ok = Lab5.leave(room, "Joe")
    refute Lab5.has_member?(room, "Joe")
  end

  test "leave non-existent member", %{room: room} do
    assert {:error, _} = Lab5.leave(room, "Joe")
  end

  test "push message", %{room: room} do
    pid1 = spawn_link(fn ->
      assert :ok = Lab5.join(room, "Joe")
      # Wait until Robert joined
      Process.sleep(200)
      assert :ok = Lab5.send_message(room, "Robert", "Joe", "Hello World")
      # Don't send message to yourself
      refute_receive {:message, "Joe", "Hello World"}, 500
    end)

    pid2 = spawn_link(fn ->
      assert :ok = Lab5.join(room, "Robert")
      assert_receive {:message, "Joe", "Hello World"}, 500
      # Only receive one message
      refute_receive {:message, "Joe", "Hello World"}, 500
    end)

    await_exits([pid1, pid2])
  end

  test "broadcast message", %{room: room} do
    pid1 = spawn_link(fn ->
      assert :ok = Lab5.join(room, "Joe")
      # Wait until Robert and Mike joined
      Process.sleep(200)
      assert :ok = Lab5.send_messages(room, "Joe", "Hello World")
      # Don't send message to yourself
      refute_receive {:message, "Joe", "Hello World"}, 500
    end)

    pid2 = spawn_link(fn ->
      assert :ok = Lab5.join(room, "Robert")
      assert_receive {:message, "Joe", "Hello World"}, 500
      # Only receive one message
      refute_receive {:message, "Joe", "Hello World"}, 500
    end)

    pid3 = spawn_link(fn ->
      assert :ok = Lab5.join(room, "Mike")
      assert_receive {:message, "Joe", "Hello World"}, 500
      # Only receive one message
      refute_receive {:message, "Joe", "Hello World"}, 500
    end)

    await_exits([pid1, pid2, pid3])
  end

  defp await_exits(pids) do
    pids
    |> Enum.map(&{&1, Process.monitor(&1)})
    |> Enum.each(fn {pid, ref} ->
      assert_receive {:DOWN, ^ref, :process, ^pid, :normal}, 1000
    end)
  end
end
