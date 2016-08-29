defmodule Chat.Room do
  defstruct [:members, :messages]

  def new do
    %Chat.Room{members: [], messages: []}
  end

  def join(room, username) do
    if username in room.members do
      raise ArgumentError, message: "username already taken"
    else
      %{room | members: [username|room.members]}
    end
  end

  def leave(room, username) do
    if username in room.members do
      %{room | members: List.delete(room.members, username)}
    else
      raise ArgumentError, message: "user not in room"
    end
  end

  def new_message(room, username, message) do
    message = %{user: username, text: message}
    %{room | messages: [message|room.messages]}
  end

  def messages_by_user(room, username) do
    for(%{user: user, text: message} <- room.messages,
        username == user,
        do: message)
  end

  def new_message2(room, username, message, created_at) do
    message = %{user: username, text: message}, created_at: created_at}
    %{room | messages: [message|room.messages]}
  end

  def messages_by_user2(room, username, created_after) do
    for(%{user: user, text: message, created_at: created_at} <- room.messages,
        username == user,
        created_at > created_after
        do: message)
  end

  def messages_by_user3(room, username) do
    for(message <- room.messages,
        username == message.user,
        do: message)
    |> Enum.sort(fn x, y -> x.created_at > y.created_at end)
    |> Enum.map(& &1.text)
  end
end
