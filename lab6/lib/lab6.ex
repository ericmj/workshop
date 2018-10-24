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
    GenServer.call(server, {:join, self(), username})
  end

  def members(_server) do
    raise "not implemented yet"
  end

  def leave(_server, _username) do
    raise "not implemented yet"
  end

  def send_message(_server, _to, _from, _message) do
    raise "not implemented yet"
  end

  def send_messages(_server, _from, _message) do
    raise "not implemented yet"
  end

  # GENSERVER CALLBACKS

  def init([]) do
    {:ok, %Chat{members: %{}}}
  end

  def handle_call({:has_member?, username}, _from, chat) do
    {:reply, Map.has_key?(chat.members, username), chat}
  end

  def handle_call({:join, pid, username}, _from, chat) do
    if Map.has_key?(chat.members, username) do
      {:reply, {:error, "username already taken"}, chat}
    else
      members = Map.put(chat.members, username, pid)
      chat = %{chat | members: members}
      {:reply, :ok, chat}
    end
  end
end
