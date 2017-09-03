defmodule Lab3 do
  defmodule Chat do
    defstruct [:members]
  end

  def new() do
    %Chat{members: %{}}
  end

  def has_member?(chat, username) do
    Map.has_key?(chat.members, username)
  end

  def join(chat, username) do
    if Map.has_key?(chat.members, username) do
      raise ArgumentError, message: "username already taken"
    else
      members = Map.put(chat.members, username, [])
      %{chat | members: members}
    end
  end

  def members(_chat) do
    raise "not implemented yet"
  end

  def leave(_chat, _username) do
    raise "not implemented yet"
  end

  def send_message(_chat, _from, _to, _message) do
    raise "not implemented yet"
  end

  def send_messages(_chat, _from, _message) do
    raise "not implemented yet"
  end

  def messages_to_user(_chat, _to) do
    raise "not implemented yet"
  end

  def messages_from_user(_chat, _from) do
    raise "not implemented yet"
  end
end
