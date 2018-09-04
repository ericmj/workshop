defmodule Lab6Test do
  use ExUnit.Case
  alias Lab6

  setup do
    {:ok, server} = Lab6.new()
    %{room: server}
  end

  @tag :skip
  test "join new member", %{room: room} do
    assert :ok = Lab6.join(room, "Joe")
    assert Lab6.has_member?(room, "Joe")
    refute Lab6.has_member?(room, "Jose")
    assert Lab6.members(room) == ["Joe"]
  end

  @tag :skip
  test "join existing member", %{room: room} do
    assert :ok =  Lab6.join(room, "Joe")
    assert {:error, _} = Lab6.join(room, "Joe")
  end

  @tag :skip
  test "leave existing member", %{room: room} do
    assert :ok = Lab6.join(room, "Joe")
    assert :ok = Lab6.leave(room, "Joe")
    refute Lab6.has_member?(room, "Joe")
  end

  @tag :skip
  test "leave non-existent member", %{room: room} do
    assert {:error, _} = Lab6.leave(room, "Joe")
  end

  @tag :skip
  test "push message", %{room: room} do
    pid1 = spawn_link(fn ->
      assert :ok = Lab6.join(room, "Joe")
      # Wait until Robert joined
      Process.sleep(200)
      assert :ok = Lab6.send_message(room, "Robert", "Joe", "Hello World")
      # Don't send message to yourself
      refute_receive {:message, "Joe", "Hello World"}, 500
    end)

    pid2 = spawn_link(fn ->
      assert :ok = Lab6.join(room, "Robert")
      assert_receive {:message, "Joe", "Hello World"}, 500
      # Only receive one message
      refute_receive {:message, "Joe", "Hello World"}, 500
    end)

    await_exits([pid1, pid2])
  end

  @tag :skip
  test "broadcast message", %{room: room} do
    pid1 = spawn_link(fn ->
      assert :ok = Lab6.join(room, "Joe")
      # Wait until Robert and Mike joined
      Process.sleep(200)
      assert :ok = Lab6.send_messages(room, "Joe", "Hello World")
      # Don't send message to yourself
      refute_receive {:message, "Joe", "Hello World"}, 500
    end)

    pid2 = spawn_link(fn ->
      assert :ok = Lab6.join(room, "Robert")
      assert_receive {:message, "Joe", "Hello World"}, 500
      # Only receive one message
      refute_receive {:message, "Joe", "Hello World"}, 500
    end)

    pid3 = spawn_link(fn ->
      assert :ok = Lab6.join(room, "Mike")
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
