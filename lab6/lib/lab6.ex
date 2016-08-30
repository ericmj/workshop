defmodule Lab6 do
  defmodule Room do
    defstruct [:members]
  end

  def start_link do
    Agent.start_link(fn ->
      %Room{members: %{}}
    end)
  end

  def join(pid, username) do
    from = self()
    Agent.update(pid, fn room ->
      member = %{name: username, pid: from}
      members = Map.put(room.members, username, member)
      %{room | members: members}
    end)
  end

  def leave(pid, username) do
    Agent.update(pid, fn room ->
      members = Map.delete(room.members, username)
      %{room | members: members}
    end)
  end

  def send(_pid, _from, _to, _message) do
    raise "not implemented yet"
  end

  def broadcast(_pid, _from, _message) do
    raise "not implemented yet"
  end
end
