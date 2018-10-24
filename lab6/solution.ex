defmodule Lab6 do
  defmodule Chat do
    defstruct [:members]
  end

  use GenServer

  # PUBLIC API

  def new() do
    GenServer.start_link(__MODULE__, [])
  end

  def has_member?(server, username) do
    GenServer.call(server, {:has_member?, username})
  end

  def join(server, username) do
    GenServer.call(server, {:join, username})
  end

  def members(server) do
    GenServer.call(server, :members)
  end

  def leave(server, username) do
    GenServer.call(server, {:leave, username})
  end

  def send_message(server, to, from, message) do
    GenServer.call(server, {:send_message, to, from, message})
  end

  def send_messages(server, from, message) do
    GenServer.call(server, {:send_messages, from, message})
  end

  # GENSERVER CALLBACKS

  def init([]) do
    {:ok, %Chat{members: %{}}}
  end

  def handle_call({:has_member?, username}, _from, chat) do
    {:reply, Map.has_key?(chat.members, username), chat}
  end

  def handle_call({:join, username}, {pid, _tag}, chat) do
    if Map.has_key?(chat.members, username) do
      {:reply, {:error, "username already taken"}, chat}
    else
      members = Map.put(chat.members, username, pid)
      chat = %{chat | members: members}
      {:reply, :ok, chat}
    end
  end

  def handle_call(:members, _from, chat) do
    members = Map.keys(chat.members)
    {:reply, members, chat}
  end

  def handle_call({:leave, username}, _from, chat) do
    if Map.has_key?(chat.members, username) do
      members = Map.delete(chat.members, username)
      chat = %{chat | members: members}
      {:reply, :ok, chat}
    else
      {:reply, {:error, "user not in chat"}, chat}
    end
  end

  def handle_call({:send_message, to, from, message}, _from, chat) do
    case Map.fetch(chat.members, to) do
      {:ok, to} ->
        send(to, {:message, from, message})
        {:reply, :ok, chat}

      :error ->
        {:reply, {:error, "user not in chat"}, chat}
    end
  end

  def handle_call({:send_messages, from, message}, _from, chat) do
    chat.members
    |> Map.delete(from)
    |> Map.values()
    |> Enum.each(&send(&1, {:message, from, message}))

    {:reply, :ok, chat}
  end
end
