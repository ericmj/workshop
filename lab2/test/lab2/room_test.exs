defmodule Lab2.RoomTest do
  use ExUnit.Case
  use TrueStory

  story "create a message", c
    |> message(:message, {"Joe", "Hello"}),
  verify do
    assert {"Joe", "Hello"} = c.message
  end

  story "create a second message", c
    |> message(:message1, {"Mike", "Erlang"})
    |> message(:message2, {"Robert", "LFE"}),
  verify do
    assert {"Mike", "Erlang"} = c.message1
    assert {"Robert", "LFE"} = c.message2
  end

  story "create a member", c
    |> message(:message, {"Joe", "Hello Jose"})
    |> member(:member, "Jose", [c.message]),
  verify do
    assert %{name: "Jose", messages: [{"Joe", "Hello Jose"}]} = c.member
  end

  story "create a room", c
    |> member(:mike, "Mike")
    |> member(:robert, "Robert")
    |> room(%{mike: c.mike, robert: c.robert}),
  verify do
    assert %{mike: %{name: "Mike", messages: []},
             robert: %{name: "Robert", messages: []}} = c.room
  end
end
