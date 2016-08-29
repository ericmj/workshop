defmodule Lab2.RoomTest do
  use ExUnit.Case
  use TrueStory
  alias Lab2.Room

  story "create a message", c
    |> message(:message, "Joe", "Hello")
  verify do
    assert {"Joe", "Hello"} = c.message
  end

  story "create a second message", c
    |> message(:message1, "Mike", "Erlang")
    |> message(:message2, "Robert", "LFE")
  verify do
    assert {"Mike", "Erlang"} = c.message1
    assert {"Robert", "LFE"} = c.message2
  end

  story "create a member", c
    |> message(:message, "Joe", "Hello")
    |> member(:member, "Jose", [:message])

  story "new room", c
    |> new_room(:room),
  verify do
    assert %Room{} = c.room
  end

  story "new room with members and messages", c
    |> new_room(:room, members: ["jose"], messages: ["Hello"]),
  verify do
    assert %Room{members: ["jose"], messages: ["Hello"]} = c.room
  end

  story "add member", c
    |> new_room(:room)
    |> add_member(:room, "Jose"),
  verify do
    assert "Jose" in c.room.members
    refute "Joe" in c.room.members
  end

  story "add message", c
    |> new_room(:room)
    |> add_message(:room, "Hello Joe!"),
  verify do
    assert "Hello Joe!" in c.room.messages
  end

  story "add members to multiple rooms", c
    |> new_room(:room1)
    |> new_room(:room2)
    |> add_member(:room1, "Jose")
    |> add_member(:room2, "James"),
  verify do
    assert c.room1.members == ["Jose"]
    assert c.room2.members == ["James"]
  end
end
