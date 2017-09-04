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
    spawn_link(fn ->
      assert :ok = Lab5.join(room, "Joe")
      # Wait until Robert joined
      Process.sleep(100)
      assert :ok = Lab5.send_message(room, "Joe", "Robert", "Hello World")
      # Don't send message to yourself
      refute_receive {:message, "Joe", "Hello World"}
    end)

    spawn_link(fn ->
      assert :ok = Lab5.join(room, "Robert")
      # Don't send message to yourself
      assert_receive {:message, "Joe", "Hello World"}
      # Only receive one message
      refute_receive {:message, "Robert", "Hello World"}
    end)
  end

  test "broadcast message", %{room: room} do
    spawn_link(fn ->
      assert :ok = Lab5.join(room, "Joe")
      # Wait until Robert joined
      Process.sleep(100)
      assert :ok = Lab5.send_message(room, "Joe", "Robert", "Hello World")
      # Don't send message to yourself
      refute_receive {:message, "Robert", "Hello World"}
    end)

    spawn_link(fn ->
      assert :ok = Lab5.join(room, "Robert")
      assert_receive {:message, "Joe", "Hello World"}
      # Only receive one message
      refute_receive {:message, "Robert", "Hello World"}
    end)

    spawn_link(fn ->
      assert :ok = Lab5.join(room, "Mike")
      assert_receive {:message, "Joe", "Hello World"}
      # Only receive one message
      refute_receive {:message, "Robert", "Hello World"}
    end)
  end
end
