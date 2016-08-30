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

  def leave(_room, _username) do
    raise "not implemented yet"
  end

  def send_message(_room, _from, _to, _message) do
    raise "not implemented yet"
  end

  def broadcast_message(_room, _from, _message) do
    raise "not implemented yet"
  end

  def messages_to_user(_room, _to) do
    raise "not implemented yet"
  end

  def messages_from_user(_room, _from) do
    raise "not implemented yet"
  end
end
