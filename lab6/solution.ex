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
    spawn_link(fn ->
      assert :ok = Lab6.join(room, "Joe")
      # Wait until Robert joined
      Process.sleep(100)
      assert :ok = Lab6.send_message(room, "Joe", "Robert", "Hello World")
      # Don't send message to yourself
      refute_receive {:message, "Joe", "Hello World"}
    end)

    spawn_link(fn ->
      assert :ok = Lab6.join(room, "Robert")
      # Don't send message to yourself
      assert_receive {:message, "Joe", "Hello World"}
      # Only receive one message
      refute_receive {:message, "Robert", "Hello World"}
    end)
  end

  test "broadcast message", %{room: room} do
    spawn_link(fn ->
      assert :ok = Lab6.join(room, "Joe")
      # Wait until Robert joined
      Process.sleep(100)
      assert :ok = Lab6.send_message(room, "Joe", "Robert", "Hello World")
      # Don't send message to yourself
      refute_receive {:message, "Robert", "Hello World"}
    end)

    spawn_link(fn ->
      assert :ok = Lab6.join(room, "Robert")
      assert_receive {:message, "Joe", "Hello World"}
      # Only receive one message
      refute_receive {:message, "Robert", "Hello World"}
    end)

    spawn_link(fn ->
      assert :ok = Lab6.join(room, "Mike")
      assert_receive {:message, "Joe", "Hello World"}
      # Only receive one message
      refute_receive {:message, "Robert", "Hello World"}
    end)
  end
end
