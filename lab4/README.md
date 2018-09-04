# Lab4

### Lab purpose

Learn about processes and message passing. You'll have some simple exercises
that make use of basic Elixir concurrency using primitives.

### Lab instructions

The `lab4` directory has a file `lib/lab4.ex` which contains an implementation of process-related
functions. As usual, use that template to implement features until all of your tests pass.

  1. Create a process that just prints the first message it receives
     and then dies. This function should return the `pid` of the new process. The message needs to
     be printed to the console with `IO.write(:stderr, message)` to be able to
     easily capture it in tests.

  2. Create a process that prints messages like in the previous task, but instead
     of dying after the first message, keep printing new messages with `IO.write(:stderr, message)`.

  3. Create a process that waits for a message containing a list, sum the list
     (you can use code from lab1), and reply to the original process. The message will be in the format:
     `{:sum, pid, list}`, where `pid` is the pid of the process the reply should be sent to.

  4. Spawn N number of processes doing the previous task in parallel and wait
     for the responses. (As an extra exercise make sure to return the results in
     the order the input was given.)


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
