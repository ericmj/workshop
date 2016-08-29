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
  end

  def new_message(room, username, message) do
  end

  def messages_by_user(room, username) do
  end
end

