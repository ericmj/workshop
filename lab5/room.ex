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
  end

  def members(pid) do
  end

  def new_message(pid, username, message) do
  end

  def messages_by_user(pid, username) do
  end
end
