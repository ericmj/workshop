defmodule Lab2.TestLibrary do
  import Map, only: [put: 3, update!: 3]

  def new_room(c, key) do
    put(c, key, %Lab2.Room{members: [], messages: []})
  end

  def new_room(c, key, opts) do
    put(c, key, struct(Lab2.Room, opts))
  end

  def add_member(c, key, name) do
    put(c, key, update!(c[key], :members, &[name|&1]))
  end

  def add_message(c, key, message) do
    put(c, key, update!(c[key], :messages, &[message|&1]))
  end
end
