# Lab2

### Lab purpose

This lab will teach you how to write a TrueStory testing library for a chat room.


### Lab instructions

We have learned that functional APIs start with data structure and types, and
then layer on behavior. When you build tests for production software, much of your
time will be spent setting up data structures so that you can test your functions. In
this lab, we'll focus on exactly that.

The `lab2` directory has a file `test/lab2/room_test.exs` which contains some stories for the
chat room. We are going to implement the library functions used to build the stories. Read
through the stories and see how they describe the setup for each individual test.

Your job is to implement the `Library`, or the module that each of these stories come from.

  1. `import` the `Lab2.TestLibrary` module in our test file. The stub module is
     located in `test/lab2/test_library.exs`. Importing will make the functions
     available without prefixing with the namespace. Importing will *not* load
     the module - that is done in `test/test_helper.exs`.

  2. Implement the `message/3`function in `Lab2.TestLibrary`. The `message/3`
     function will take arguments for the context, a key for the message, and a
     value for the message, like this: `message(c, key, tuple)` so that you can
     add a message to your stories like: `|> message(:message, {:user1, "Hello, world"})`

  3. Implement the `member/4` function in `Lab2.TestLibrary`. The `member/4`
     function will take arguments for the context, a key, a name, and the messages
     (which you can default to `[]` if it's not provided, if you would like).

  4. Implement the `room/2` function to create a room at key `:room`. The function
     takes the context followed by the full room structure so you can use it like
     `|> room(%{jack: c.jack, jill: c.jill})`

### Links

Getting started guide: http://elixir-lang.org/getting-started/introduction.html

API docs: http://elixir-lang.org/docs/stable/elixir/

  1. ExUnit assertions http://elixir-lang.org/docs/stable/ex_unit

  2. TrueStory http://hexdocs.pm/true_story/

  3. `import/2` http://elixir-lang.org/docs/stable/elixir/Kernel.SpecialForms#import/2

  4. `assert/1` http://elixir-lang.org/docs/stable/ex_unit/ExUnit.Assertions.html#assert/1

  5. `refute/1` http://elixir-lang.org/docs/stable/ex_unit/ExUnit.Assertions.html#refute/1


### Solution ( no peeking :) )

See `solution.ex` in the `lab2` directory.
