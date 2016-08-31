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

  def members(_pid) do
    raise "not implemented yet"
  end

  def leave(_pid, _username) do
    raise "not implemented yet"
  end

  def send_message(_pid, _from, _to, _message) do
    raise "not implemented yet"
  end

  def send_messages(_pid, _from, _message) do
    raise "not implemented yet"
  end

  def messages_to_user(_pid, _to) do
    raise "not implemented yet"
  end

  def messages_from_user(_pid, _from) do
    raise "not implemented yet"
  end
end
