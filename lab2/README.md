# Lab2

### Lab purpose

In the previous lab we learned the basics about running scripts and tests,
pattern matching, and recursion.

Pattern matching and recursion are powerful tools and Elixir developers often use
these tools. For more common tasks the standard library provides you with higher-level
building blocks.

In this we lab will introduce new data types and new forms of pattern matching
with binaries. We are also going to use using higher order functions with the
`Enum` module to do transformation on lists and build composed transformation
with pipes.


### Lab instructions

Like the last lab implement the stubbed out functions in `lib/lab2.ex` and run the tests to verify the implementation is correct.

  1. Return a list of all bytes in a binary

  2. Do the reverse of task 1, convert a list of bytes to a binary

  3. Return the number of bits in a binary

  4. Double all numbers in a list using the `Enum` module

  5. Convert a keyword list to a map, only valid keyword lists need to be handled

  6. Separate all odd and even numbers in a list, return as a tuple containing a list of odds and list of evens

  7. Count the number of occurrences of each atom in a list of atoms with recursion, return as a map between atom and count,
     try using the `Enum.reduce/3` function

### Links

Getting started guide: https://elixir-lang.org/getting-started/introduction.html

API docs: https://hexdocs.pm/elixir/

  1. Binaries and bitstrings https://elixir-lang.org/getting-started/binaries-strings-and-char-lists.html#binaries-and-bitstrings

  2. `Enum` module https://hexdocs.pm/elixir/Enum.html

  3. Pipes https://hexdocs.pm/elixir/Kernel.html#%7C%3E/2

  4. Anonymous functions https://elixir-lang.org/getting-started/basic-types.html#anonymous-functions

  5. Function capturing https://elixir-lang.org/getting-started/modules-and-functions.html#function-capturing


### Solution ( no peeking :) )

See `solution.ex` in the `lab2` directory.
