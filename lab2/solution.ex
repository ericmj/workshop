defmodule Lab2.TestLibrary do
  import Map, only: [put: 3]

  def message(c, key, {from, string}) do
    put(c, key, {from, string})
  end

  def member(c, key, name, messages \\ []) do
    put(c, key, %{name: name, messages: messages})
  end

  def room(c, members) do
    put(c, :room, members)
  end
end
