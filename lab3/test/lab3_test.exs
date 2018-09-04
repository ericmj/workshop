defmodule Lab3Test do
  use ExUnit.Case
  alias Lab3.Chat

  setup do
    %{room: Lab3.new()}
  end

  @tag :skip
  test "new room", %{room: room} do
    assert %Chat{} = room
  end

  @tag :skip
  test "join new member", %{room: room} do
    room = Lab3.join(room, "Joe")
    assert Lab3.has_member?(room, "Joe")
    refute Lab3.has_member?(room, "Jose")
    assert Lab3.members(room) == ["Joe"]
  end

  @tag :skip
  test "join existing member", %{room: room} do
    room = Lab3.join(room, "Joe")
    assert_raise ArgumentError, fn ->
      Lab3.join(room, "Joe")
    end
  end

  @tag :skip
  test "leave existing member", %{room: room} do
    room = Lab3.join(room, "Joe")
    room = Lab3.leave(room, "Joe")
    refute Lab3.has_member?(room, "Joe")
  end

  @tag :skip
  test "leave non-existent member", %{room: room} do
    assert_raise ArgumentError, fn ->
      Lab3.leave(room, "Joe")
    end
  end

  @tag :skip
  test "broadcast message", %{room: room} do
    room = Lab3.join(room, "Joe")
    room = Lab3.join(room, "Robert")
    room = Lab3.send_messages(room, "Joe", "Hello World")
    assert Lab3.messages_to_user(room, "Joe") == ["Hello World"]
    assert Lab3.messages_to_user(room, "Robert") == ["Hello World"]
  end

  @tag :skip
  test "messages to user", %{room: room} do
    room = Lab3.join(room, "Joe")
    room = Lab3.send_message(room, "Robert", "Joe", "Hello Joe")
    assert Lab3.messages_to_user(room, "Joe") == ["Hello Joe"]
    assert Lab3.messages_to_user(room, "Robert") == []
  end

  @tag :skip
  test "messages from user", %{room: room} do
    room = Lab3.join(room, "Joe")
    room = Lab3.send_message(room, "Robert", "Joe", "Hello Joe")
    assert Lab3.messages_from_user(room, "Robert") == ["Hello Joe"]
    assert Lab3.messages_from_user(room, "Joe") == []
  end
end
