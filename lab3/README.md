# Lab3

### Lab purpose

In this lab, you will build an API to work with the data structures we explored for Lab 2. We will implement our chat room features with an API that works with data structures we set up for Lab 2. Each of our APIs will transform a chat room, building a new one. These are the functions you'll work on:

  * `leave()` will remove a member from the chatroom
  * `members()` will return the member names in the chatroom
  * `send_message()` will add a new message to the message list for a user
  * `send_messages()` will add a new message to the message list for all users

If you have more time, you can implement two other functions, which filter through messages in the chatroom.

  * `messages_from_user()` and `messages_to_user()` will list all of the messages from or to a given user.

### Lab instructions

Clone `lab3` from git if you haven't already done so.

The `lab3` directory has a file `lib/lab3.ex` which contains an implementation of chat
room with some stubbed out functions. These are the functions you'll implement. For each
new function, you will:

  1. run `mix test`. You will see the failures for each of your unimplemented features.

  2. Implement the missing feature, and iterate on it until the test passes.


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


### Solution ( no peeking :) )

See `solution.ex` in the `lab3` directory.
