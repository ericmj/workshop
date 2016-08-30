defmodule Lab3Test do
  use ExUnit.Case
  use TrueStory
  import Lab3
  alias Lab3.Room

  defp room(c) do
    assign c, room: new()
  end

  story "new room", c
    |> room,
  verify do
    assert %Room{} = c.room
  end

  story "join new member", c
    |> room,
  verify do
    room = join(c.room, "Joe")
    assert has_member?(room, "Joe")
    refute has_member?(room, "Jose")
  end

  story "join existing member", c
    |> room,
  verify do
    room = join(c.room, "Joe")
    assert_raise ArgumentError, fn ->
      join(room, "Joe")
    end
  end

  story "leave existing member", c
    |> room,
  verify do
    room = join(c.room, "Joe")
    room = leave(room, "Joe")
    refute has_member?(room, "Joe")
  end

  story "leave non-existent member", c
    |> room,
  verify do
    assert_raise ArgumentError, fn ->
      leave(c.room, "Joe")
    end
  end

  story "broadcast message", c
    |> room,
  verify do
    room = join(c.room, "Joe")
    room = join(room, "Robert")
    room = broadcast_message(room, "Joe", "Hello World")
    assert messages_to_user(room, "Joe") == ["Hello World"]
    assert messages_to_user(room, "Robert") == ["Hello World"]
  end

  story "messages to user", c
    |> room,
  verify do
    room = join(c.room, "Joe")
    room = send_message(room, "Robert", "Joe", "Hello Joe")
    assert messages_to_user(room, "Joe") == ["Hello Joe"]
    assert messages_to_user(room, "Robert") == []
  end

  story "messages from user", c
    |> room,
  verify do
    room = join(c.room, "Joe")
    room = send_message(room, "Robert", "Joe", "Hello Joe")
    assert messages_from_user(room, "Robert") == ["Hello Joe"]
    assert messages_from_user(room, "Joe") == []
  end
end
