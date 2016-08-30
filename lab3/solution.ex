defmodule Lab3 do
  defmodule Room do
    defstruct [:members]
  end

  def new do
    %Room{members: %{}}
  end

  def has_member?(room, username) do
    Map.has_key?(room.members, username)
  end

  def join(room, username) do
    if Map.has_key?(room.members, username) do
      raise ArgumentError, message: "username already taken"
    else
      members = Map.put(room.members, username, [])
      %{room | members: members}
    end
  end

  def leave(room, username) do
    if Map.has_key?(room.members, username) do
      members = Map.delete(room.members, username)
      %{room | members: members}
    else
      raise ArgumentError, message: "user not in room"
    end
  end

  def new_message(room, from, to, message) do
    case Map.fetch(room.members, to) do
      {:ok, messages} ->
        members = Map.put(room.members, to, [{from, message}|messages])
        %{room | members: members}
      :error ->
        raise ArgumentError, message: "user not in room"
    end
  end

  def messages_to_user(room, to) do
    messages = Map.get(room.members, to, [])
    Enum.map(messages, fn {_from, contents} -> contents end)
  end

  def messages_from_user(room, from) do
    Enum.flat_map(room.members, fn {_to, messages} ->
      for {^from, message} <- messages, do: message
    end)
  end
end
