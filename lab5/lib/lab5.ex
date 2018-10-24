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
          members = Map.put(chat.members, username, pid)
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

    raise "not implemented yet"
  def members(pid) do
  end

  def leave(_pid, _username) do
    raise "not implemented yet"
  end

  def send_message(_pid, _to, _from, _message) do
    raise "not implemented yet"
  end

  def send_messages(_pid, _from, _message) do
    raise "not implemented yet"
  end
end
