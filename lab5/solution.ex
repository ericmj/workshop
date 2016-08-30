defmodule Lab5 do
  defmodule Room do
    defstruct [:members]
  end

  def start_link do
    Agent.start_link(fn ->
      %Room{members: %{}}
    end)
  end

  def has_member?(pid, username) do
    Agent.get(pid, fn room ->
      Map.has_key?(room.members, username)
    end)
  end

  def join(pid, username) do
    Agent.update(pid, fn room ->
      members = Map.put(room.members, username, [])
      %{room | members: members}
    end)
  end

  def leave(pid, username) do
    Agent.update(pid, fn room ->
      members = Map.delete(room.members, username)
      %{room | members: members}
    end)
  end

  def new_message(pid, from, to, message) do
    Agent.update(pid, fn room ->
      messages = Map.fetch!(room.members, to)
      members = Map.put(room.members, to, [{from, message}|messages])
      %{room | members: members}
    end)
  end

  def messages_to_user(pid, to) do
    Agent.get(pid, fn room ->
      messages = Map.get(room.members, to, [])
      Enum.map(messages, fn {_from, contents} -> contents end)
    end)
  end

  def messages_from_user(pid, from) do
    Agent.get(pid, fn room ->
      Enum.flat_map(room.members, fn {_to, messages} ->
        for {^from, message} <- messages, do: message
      end)
    end)
  end
end
