defmodule Lab5Test do
  use ExUnit.Case
  use TrueStory
  import Lab5

  defp room(c) do
    {:ok, pid} = start_link()
    assign c, room: pid
  end

  story "join new member", c
    |> room,
  verify do
    join(c.room, "Joe")
    assert has_member?(c.room, "Joe")
    refute has_member?(c.room, "Jose")
  end

  story "leave existing member", c
    |> room,
  verify do
    join(c.room, "Joe")
    leave(c.room, "Joe")
    refute has_member?(c.room, "Joe")
  end

  story "messages to user", c
    |> room,
  verify do
    join(c.room, "Joe")
    new_message(c.room, "Robert", "Joe", "Hello Joe")
    assert messages_to_user(c.room, "Joe") == ["Hello Joe"]
    assert messages_to_user(c.room, "Robert") == []
  end

  story "messages from user", c
    |> room,
  verify do
    join(c.room, "Joe")
    new_message(c.room, "Robert", "Joe", "Hello Joe")
    assert messages_from_user(c.room, "Robert") == ["Hello Joe"]
    assert messages_from_user(c.room, "Joe") == []
  end
end
