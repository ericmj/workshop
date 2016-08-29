# Lab2

### Lab purpose

This lab will teach you how to write a TrueStory testing library for a chat room.


### Lab instructions

The `lab2` directory has a file `test/lab2/room_test.exs` which contains some stories for the
chat room. We are going to implement the library functions used to build the stories.

  1. `import` the `Lab2.TestLibrary` module in our test file. The stub module is
     located in `test/lab2/test_library.exs`. Importing will make the functions
     available without prefixing with the namespace. Importing will *not* load
     the module - that is done in `test/test_helper.exs`.

  2. Implement the `new_room/2` and `new_room/3` functions in `Lab2.TestLibrary`.

  3. Implement the `new_member/2` function.

  4. Implement the `new_message/2` function.

### Links

Getting started guide: http://elixir-lang.org/getting-started/introduction.html

API docs: http://elixir-lang.org/docs/stable/elixir/

  1. ExUnit assertions http://elixir-lang.org/docs/stable/ex_unit

  2. TrueStory http://hexdocs.pm/true_story/

  3. `import/2` http://elixir-lang.org/docs/stable/elixir/Kernel.SpecialForms#import/2

  4. `assert/1` http://elixir-lang.org/docs/stable/ex_unit/ExUnit.Assertions.html#assert/1

  5. `assert_raise/3` http://elixir-lang.org/docs/stable/ex_unit/ExUnit.Assertions.html#assert_raise/3

  6. `refute/1` http://elixir-lang.org/docs/stable/ex_unit/ExUnit.Assertions.html#refute/1


### Solution ( no peeking :) )

See `solution.ex` in the `lab3` branch.
