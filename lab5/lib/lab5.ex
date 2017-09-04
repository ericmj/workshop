defmodule Lab5 do
  defmodule Chat do
    defstruct [:members]
  end

  def new() do
    spawn_link(fn ->
      loop(%Chat{members: %{}})
    end)
  end

  defp loop(chat) do
    receive do
      {:has_member?, pid, username} ->
        send(pid, Map.has_key?(chat.members, username))
        loop(chat)

      {:join, pid, username} ->
        if Map.has_key?(chat.members, username) do
          send(pid, {:error, "username already taken"})
          loop(chat)
        else
          send(pid, :ok)
          members = Map.put(chat.members, username, [])
          loop(%{chat | members: members})
        end
    end
  end

  defp send_and_wait_reply(pid, message) do
    send(pid, message)
    receive do
      message ->
        message
    after
      1000 ->
        raise "timeout waiting for reply"
    end
  end

  def has_member?(pid, username) do
    send_and_wait_reply(pid, {:has_member?, self(), username})
  end

  def join(pid, username) do
    send_and_wait_reply(pid, {:join, self(), username})
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
end
