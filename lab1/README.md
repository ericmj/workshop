# LAB1

### Lab purpose

This lab should teach you how to write and run simple Elixir scripts. You will
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

##### For example

```elixir
# lib/lab1.ex

defmodule Lab1 do
  def taskX([_first, second | _rest]) do
    second
  end

  def taskX(_) do
    nil
  end
end
```

```
~ λ iex -r lib/lab1.ex
Erlang/OTP 19 [erts-8.0] [source] [64-bit] [smp:8:8] [async-threads:10] [hipe] [kernel-poll:false]

Interactive Elixir (1.3.2) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> Lab1.taskX [:a, :b, :c]
:b
```


##### Advanced user problems (if you have more time)

  1. Return the minimum value of a list with recursion.

  2. Return the average value of a list with recursion.

  3. Count the number of occurrences of each atom in a list of atoms with recursion.

  4. Can you solve the above tasks by using higher-order functions and using
     functions on the module `Enum` and `List` in Elixir's standard library?


### Links

Getting started guide: http://elixir-lang.org/getting-started/introduction.html

API docs: http://elixir-lang.org/docs/stable/elixir/

  1. Modules http://elixir-lang.org/getting-started/modules.html

  2. Recursion http://elixir-lang.org/getting-started/recursion.html

  3. Pipes http://elixir-lang.org/docs/stable/elixir/Kernel.html#%7C%3E/2

  4. `IO.inspect/1` http://elixir-lang.org/docs/master/elixir/IO.html#inspect/2

  5. Map syntax http://elixir-lang.org/docs/master/elixir/Kernel.SpecialForms.html#%25%7B%7D/1


### Solution ( no peeking :) )

See `solution.ex` in the `lab1` directory.
