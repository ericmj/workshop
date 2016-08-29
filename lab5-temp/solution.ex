defmodule Chat.Room do
  defstruct [:members, :messages]

  def start_link do
    Agent.start_link(fn ->
      %Chat.Room{members: [], messages: []}
    end)
  end

  def join(pid, username) do
    Agent.update(pid, fn room ->
      if username in room.members do
        raise ArgumentError, message: "username already taken"
      else
        %{room | members: [username|room.members]}
      end
    end)
  end

  def leave(pid, username) do
    Agent.update(pid, fn room ->
      if username in room.members do
        %{room | members: List.delete(room.members, username)}
      else
        raise ArgumentError, message: "user not in room"
      end
    end)
  end

  def members(pid) do
    Agent.get(pid, fn room ->
      room.members
    end)
  end

  def new_message(pid, username, message) do
    Agent.update(pid, fn room ->
      message = %{user: username, text: message}
      %{room | messages: [message|room.messages]}
    end)
  end

  def messages_by_user(pid, username) do
    Agent.get(pid, fn room ->
      for(%{user: user, text: message} <- room.messages,
          username == user,
          do: message)
    end)
  end
end
