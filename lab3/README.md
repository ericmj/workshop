# Lab3

### Lab purpose

In this lab you will create a basic chat room. We are going to put to use the
skills from lab 1 and will also learn how to create and use a Mix project.

Try to complete this lab without using the `List` and `Enum` modules.


### Lab instructions

Create a new mix project with `mix new lab3`.

The `lab3` directory has a file `lib/lab3.ex` which contains an implementation of chat
room with some stubbed out functions. Copy the file to `lib/` in your project and
implement the functions.

  1. Implement the `leave/2` function. Raise an error if the user leaving was
     not previously a member of the function.

  2. Implement the `new_message/4` function. A message is a tuple of a username,
     message contents pair.

  3. Implement the function `messages_to_user/2`. Return all messages sent to the
     given user.

  3. Implement the function `messages_from_user/2`. Return all messages authored
     by the given user. TIP: A map is enumerable and take a look at the `Enum.flat_map/2`
     function and `for` comprehensions.


### Links

Getting started guide: http://elixir-lang.org/getting-started/introduction.html

API docs: http://elixir-lang.org/docs/stable/elixir/

  1. Maps http://elixir-lang.org/getting-started/maps-and-dicts.html

  2. Map syntax http://elixir-lang.org/docs/master/elixir/Kernel.SpecialForms.html#%{}/1

  3. Structs http://elixir-lang.org/getting-started/struct.html

  4. `raise/1` http://elixir-lang.org/docs/stable/elixir/Kernel.html#raise/1

  5. `assert_raise/1` http://elixir-lang.org/docs/stable/ex_unit/ExUnit.Assertions.html#assert_raise/2

  6. `Enum.flat_map/2` http://elixir-lang.org/docs/stable/elixir/Enum.html#flat_map/2

  7. `for` comprehensions http://elixir-lang.org/docs/stable/elixir/Kernel.SpecialForms.html#for/1


### Solution ( no peeking :) )

See `solution.ex` in the `lab3` directory.
