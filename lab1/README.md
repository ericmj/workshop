# LAB1

### Lab purpose

This lab will teach you how to write and run simple Elixir scripts. You will
learn how to write modules and functions. Additionally you will learn some
functional programming concepts such as recursion, list handling and pattern
matching.

### Lab instructions

Run files in your shell with `$ elixir lib/lab1.ex`

Run the tests in your shell with `$ mix test`

You will notice that your tests fail. Your job is to implement the tasks so
that the tests pass.

As you build your functions, you can require each separate file in
in Elixir's interactive shell `$ iex -r lib/lab1.ex`. Alternatively, you can
load and start the full Mix project environment with `$ iex -S mix`.

After changes to a module the console can be reloaded with `r Lab1` in IEx. Check the
README in the base directory for instructions on how to run tests.

  1. Enter the existing directory `lab1`. There is a stub module `Lab1` in the file `lib/lab1.ex`,
     all tasks in this lab should be implemented as functions in this module.

  2. Return the first and third element of a list.

  3. Return all but the three first elements of a list.

  4. Add up all of the elements of a list.

  5. Return the minimum value of a list with recursion.

  6. Return the average value of a list with recursion.

##### For example

```elixir
# lib/lab1.ex

defmodule Lab1 do
  def second_element([_first, second | _rest]) do
    second
  end

  def second_element(_) do
    nil
  end
end
```

```
~ λ iex -r lib/lab1.ex
Erlang/OTP 20 [erts-9.0] [source] [64-bit] [smp:8:8] [ds:8:8:10] [async-threads:10] [hipe] [kernel-poll:false]

Interactive Elixir (1.5.1) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> Lab1.second_element [:a, :b, :c]
:b
```


### Links

Getting started guide: https://elixir-lang.org/getting-started/introduction.html

API docs: https://hexdocs.pm/elixir/

  1. Modules https://elixir-lang.org/getting-started/modules.html

  2. Recursion https://elixir-lang.org/getting-started/recursion.html

  3. Basic types https://elixir-lang.org/getting-started/basic-types.html

  4. `IO.inspect/1` https://hexdocs.pm/elixir/IO.html#inspect/2


### Solution ( no peeking :) )

See `solution.ex` in the `lab1` directory.
