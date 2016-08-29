defmodule Lab2.TestLibrary do
  import Map, only: [put: 3]

  def message(c, key, from, string) do
    put(c, key, {from, string})
  end

  def member(c, key, name, message_keys) do
    messages = Enum.map(message_keys, &c[&1])
    put(c, key, %{name: name, messages})
  end

  def room(c, key, member_keys) do
    members = Enum.map(member_keys, &c[&1])
    put(c, key, members)
  end
end
