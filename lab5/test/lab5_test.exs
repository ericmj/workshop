defmodule Lab5Test do
  use ExUnit.Case
  alias Lab5

  setup do
    %{chat: Lab5.new()}
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

  test "leave existing member" %{room: room} do
    assert :ok = Lab5.join(room, "Joe")
    assert :ok = Lab5.leave(room, "Joe")
    refute Lab5.has_member?(room, "Joe")
  end

  test "leave non-existent member" %{room: room} do
    assert {:error, _} = Lab5.leave(room, "Joe")
  end

  test "push message", %{room: room} do
    assert :ok = Lab5.join(room, "Joe")
    assert :ok = Lab5.join(room, "Robert")
    assert :ok = Lab5.send_message(room, "Joe", "Robert", "Hello World")

    assert_received {:message, "Joe", "Hello World"}
    refute_received {:message, "Joe", "Hello World"}
  end

  test "broadcast message", %{room: room} do
    assert :ok = Lab5.join(room, "Joe")
    assert :ok = Lab5.join(room, "Robert")
    assert :ok = Lab5.send_messages(room, "Joe", "Hello World")

    assert_received {:message, "Joe", "Hello World"}
    assert_received {:message, "Joe", "Hello World"}
    refute_received {:message, "Joe", "Hello World"}
  end
end
