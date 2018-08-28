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

  def leave(chat, username) do
    if Map.has_key?(chat.members, username) do
      members = Map.delete(chat.members, username)
      %{chat | members: members}
    else
      raise ArgumentError, message: "user not in chat"
    end
  end

  def members(chat) do
    Enum.map(chat.members, fn {username, _messages} -> username end)
  end

  def send_message(chat, from, to, message) do
    case Map.fetch(chat.members, to) do
      {:ok, messages} ->
        members = Map.put(chat.members, to, [{from, message} | messages])
        %{chat | members: members}

      :error ->
        raise ArgumentError, message: "user not in chat"
    end
  end

  def send_messages(chat, from, message) do
    message_tuple = {from, message}

    members =
      Enum.into(chat.members, %{}, fn {username, messages} ->
        {username, [message_tuple | messages]}
      end)

    %{chat | members: members}
  end

  def messages_to_user(chat, to) do
    messages = Map.get(chat.members, to, [])
    Enum.map(messages, fn {_from, contents} -> contents end)
  end

  def messages_from_user(chat, from) do
    Enum.flat_map(chat.members, fn {_to, messages} ->
      for {^from, message} <- messages, do: message
    end)
  end
end
