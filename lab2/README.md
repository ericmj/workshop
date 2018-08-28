# Lab2

### Lab purpose

In the previous lab we learned the basics about running scripts and tests,
pattern matching, and recursion.

Pattern matching and recursion are powerful tools that Elixir developers often use.
However, for many common tasks the standard library provides higher-level building blocks.

In this we lab will introduce new data types and new forms of pattern matching
with binaries. We are also going to use using higher order functions with the
`Enum` module to do transformation on lists and build composed transformation
with pipes.


### Lab instructions

Like you did in the last lab, implement the stubbed out functions in `lib/lab2.ex` and run
the tests with `$ mix test` to verify that the implementation is correct.

  1. Return a list of all bytes in a binary.

  2. Return the number of bits in a binary.

  3. Double all numbers in a list of numbers using the `Enum` module.

  4. Separate all odd and even numbers in a list. Return the result as a tuple containing a list of odd numbers and list of even numbers.

  5. Return the three largest numbers from a list, in the order of the smallest number first.

  6. Capitalize every word in a string. Each word in the string is separate by a space. *Tip*: use the `String.split/2` and `Enum.join/2` functions. Try to write this function as a single pipeline.

  7. Return the second longest word in string. Each word in the string is separate by a space. If the string is too short (has less than two words), return `nil`. Tip: use `Enum.sort_by/3` to sort the list and `elem/2` to fetch a value from a tuple. Again, try to write this function as a single pipeline.


### Links

Getting started guide: https://elixir-lang.org/getting-started/introduction.html

API docs: https://hexdocs.pm/elixir/

  1. Binaries and bitstrings https://elixir-lang.org/getting-started/binaries-strings-and-char-lists.html#binaries-and-bitstrings

  2. `Enum` module https://hexdocs.pm/elixir/Enum.html

  3. Pipes https://hexdocs.pm/elixir/Kernel.html#%7C%3E/2

  4. Anonymous functions https://elixir-lang.org/getting-started/basic-types.html#anonymous-functions

  5. Function capturing https://elixir-lang.org/getting-started/modules-and-functions.html#function-capturing

  6. `String` module https://hexdocs.pm/elixir/String.html


### Solution ( no peeking :) )

See `solution.ex` in the `lab2` directory.
