defmodule Lab3Test do
  use ExUnit.Case
  use TrueStory
  alias Lab3.Room

  setup do
    %{room: Room.new()}
  end

  test "new room", %{room: room} do
    assert %Room{} = room
  end

  test "join new member", %{room: room} do
    room = join(room, "Joe")
    assert has_member?(room, "Joe")
    refute has_member?(room, "Jose")
    assert members(room) == ["Joe"]
  end

  test "join existing member", %{room: room} do
    room = join(room, "Joe")
    assert_raise ArgumentError, fn ->
      join(room, "Joe")
    end
  end

  test "leave existing member" %{room: room} do
    room = join(room, "Joe")
    room = leave(room, "Joe")
    refute has_member?(room, "Joe")
  end

  test "leave non-existent member" %{room: room} do
    assert_raise ArgumentError, fn ->
      leave(room, "Joe")
    end
  end

  test "broadcast message", %{room: room} do
    room = join(room, "Joe")
    room = join(room, "Robert")
    room = send_messages(room, "Joe", "Hello World")
    assert messages_to_user(room, "Joe") == ["Hello World"]
    assert messages_to_user(room, "Robert") == ["Hello World"]
  end

  test "messages to user", %{room: room} do
    room = join(room, "Joe")
    room = send_message(room, "Robert", "Joe", "Hello Joe")
    assert messages_to_user(room, "Joe") == ["Hello Joe"]
    assert messages_to_user(room, "Robert") == []
  end

  test "messages from user", %{room: room} do
    room = join(room, "Joe")
    room = send_message(room, "Robert", "Joe", "Hello Joe")
    assert messages_from_user(room, "Robert") == ["Hello Joe"]
    assert messages_from_user(room, "Joe") == []
  end
end
