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

      {:leave, pid, username} ->
        if Map.has_key?(chat.members, username) do
          send(pid, :ok)
          members = Map.delete(chat.members, username)
          loop(%{chat | members: members})
        else
          send(pid, {:error, "user not in chat"})
          loop(chat)
        end

      {:members, pid} ->
        members = Map.keys(chat.members)
        send(pid, members)
        loop(chat)

      {:push_message, pid, to, from, message} ->
        case Map.fetch(chat.members, to) do
          {:ok, to} ->
            send(to, {:message, from, message})
            send(pid, :ok)
            loop(chat)
          :error ->
            send(pid, {:error, "user not in chat"})
            loop(chat)
        end

      {:broadcast_message, pid, from, message} ->
        chat.members
        |> Map.delete(from)
        |> Map.values()
        |> Enum.each(&send(&1, {:message, from, message}))
        send(pid, :ok)
        loop(chat)
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

  def leave(pid, username) do
    send_and_wait_reply(pid, {:leave, self(), username})
  end

  def members(pid) do
    send_and_wait_reply(pid, {:members, self()})
  end

  def send_message(pid, from, to, message) do
    send_and_wait_reply(pid, {:push_message, self(), from, to, message})
  end

  def send_messages(pid, from, message) do
    send_and_wait_reply(pid, {:broadcast_message, self(), from, message})
  end
end
