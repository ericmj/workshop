# Lab3

### Lab purpose


In this lab you will create a basic chat room. We are going to put to use the
skills from lab 1 and will also learn how to create and use a Mix project.

Try to complete this lab without using the `List` and `Enum` modules.


### Lab instructions

Create a new mix project with `mix new lab3`.

The `lab3` directory has a file `room.ex` which contains an implementation of chat
room with some stubbed out functions. Copy the file to `lib/` in your project.
Implement the functions.

Start an interactive shell with the modules in your project available with
`$ iex -S mix`, your code can be tested from the shell.

  1. Implement the `leave/2` function. Raise an error if the user leaving was
     not previously a member of the function.

  2. Implement the `new_message/3` function. A suggestion for the message type
     is to use a map with the fields `:user` and `:text`.

  3. Implement the function `messages_by_user/2`. Return all messages authored
     by the given user.


##### Advanced user problems (if you have more time)

  1. Add a `:created_at` field to messages and sort them based on creation time.
     (TIP: Represent time by a single integer and use `Enum.sort/2`)

  2. Filter messages returned by `messages_by_user/2` that was created within a
     specific time frame.


### Links

Getting started guide: http://elixir-lang.org/getting-started/introduction.html

API docs: http://elixir-lang.org/docs/stable/elixir/

  1. Maps http://elixir-lang.org/getting-started/maps-and-dicts.html

  2. Structs http://elixir-lang.org/getting-started/struct.html

  3. `in/2` operator http://elixir-lang.org/docs/stable/elixir/Kernel.html#in/2

  4. `raise/1` http://elixir-lang.org/docs/stable/elixir/Kernel.html#raise/1

  5. `Enum.sort/2` http://elixir-lang.org/docs/stable/elixir/Enum.html#sort/2

  6. Map syntax http://elixir-lang.org/docs/master/elixir/Kernel.SpecialForms.html#%{}/1


### Solution ( no peeking :) )

See `solution.ex` in the `lab2` branch.
