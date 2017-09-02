# Lab4

### Lab purpose

Learn about processes and message passing. You'll have some simple exercises
that make use of basic Elixir concurrency using primitives.

### Lab instructions

The `lab4` directory has a file `lib/lab4.ex` which contains an implementation of chat
room with some stubbed out functions. As usual, use that template to implement features
in your chatroom until all of your tests pass.

  1. Create a process that just returns the first message it receives and then dies.

  2. Create a process that waits for a message containing a list, sum the list
     (from lab1) and reply to the original process.

  3. Spawn N number of processes doing the previous task in parallel and wait
     for the responses. (As an extra exercise make sure to return the results in
     the order the input was given.)

##### Advanced user problems (if you have more time)

  1. Use one of Elixir's abstractions around processes, the `Task` module, to
     sum a list.

  2. Use tasks to do exercise 3.


### Links

Getting started guide: https://elixir-lang.org/getting-started/introduction.html

API docs: https://hexdocs.pm/elixir/

  1. `spawn/1` https://hexdocs.pm/elixir/Kernel.html#spawn/1

  2. `send/2` https://hexdocs.pm/elixir/Kernel.html#send/2

  3. `receive/1` https://hexdocs.pm/elixir/Kernel.SpecialForms.html#receive/1

  4. `Process` https://hexdocs.pm/elixir/Process.html

  5. Processes https://elixir-lang.org/getting-started/processes.html


### Solution ( no peeking :) )

See `solution.ex` in the `lab4` directory.
