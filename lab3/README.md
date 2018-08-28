# Lab3

### Lab purpose

In this lab, we will implement a chat room. Elixir is an immutable language, which means that
actions don't modify objects. Instead, we will have functions that transform our chat room data
structure and return a new chat room, leaving the original unchanged.

The chat room data structure, expressed as an Elixir struct `%Lab3.Chat{}` in our
code, has a single field `:members`. The `:members` field holds a map where the
key is the user name and the value is the messages to that user, `%{username => messages}`.
`messages` is a list of tuples `{from, text}` where `from` is the username of the
sender and `text` is the contents of the message.

As you can see the chat room struct we are working with is nested with multiple levels of data
structures. This is common in functional programming, and in this lab we will learn
how to work with such data structures.

### Lab instructions

The `lab3` directory has a file `lib/lab3.ex` which contains an implementation of out chat
room with some stubbed out functions. These are the functions you'll implement. For each
new function, you will:

  1. Run `mix test`. You will see the failures for each of your unimplemented features.

  2. Implement the missing feature, and iterate on it until the test passes.

Below are the functions for the chat room we will implement in this lab.

  * `leave()` will remove a member from the chatroom
  * `members()` will return the names of the members in the chatroom
  * `send_message()` will add a new message to the message list for a user
  * `send_messages()` will add a new message to the message list for all users

When joining, the function will raise if the user has already joined. The `leave`
function should do the same if a user that hasn't joined yet tries to leave.

If you have more time, you can implement two other functions, which filter through messages in the chatroom.

  * `messages_from_user()` and `messages_to_user()` will list all of the messages from or to a given user.

In this lab we will be using the `Map` and `Enum` modules, so take a quick look through
the documentation for those modules before you get started so you know roughly what
they provide. If you get stuck anywhere, try to go over the functions
in those modules to see if there is a function that could help you solve your problem.


### Links

Getting started guide: https://elixir-lang.org/getting-started/introduction.html

API docs: https://hexdocs.pm/elixir/

  1. Maps https://elixir-lang.org/getting-started/maps-and-dicts.html

  2. Map syntax https://hexdocs.pm/elixir/Kernel.SpecialForms.html#%25%7B%7D/1

  3. Structs https://elixir-lang.org/getting-started/struct.html

  4. `raise/1` https://hexdocs.pm/elixir/Kernel.html#raise/1

  5. `assert_raise/1` https://hexdocs.pm/ex_unit/ExUnit.Assertions.html#assert_raise/2

  6. `Enum.flat_map/2` https://hexdocs.pm/elixir/Enum.html#flat_map/2

  7. `for` comprehensions https://hexdocs.pm/elixir/Kernel.SpecialForms.html#for/1

  8. `Enum.into/3` https://hexdocs.pm/elixir/Enum.html#into/3

  9. `Map` module https://hexdocs.pm/elixir/Map.html


### Solution ( no peeking :) )

See `solution.ex` in the `lab3` directory.
