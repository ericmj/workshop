# Lab4

### Lab purpose

Learn about processes and message passing. We'll be using a slightly different flow. 
In this lab, we are testing concurrent features without demanding setup requirements, 
so TrueStory doesn't make much sense. We'll be testing with plain old ExUnit tests. 

We'll also revise the flow a little bit, so you'll know how to create a project
from scratch. 

### Lab instructions

Create a new mix project with `mix new lab4`.

The `lab4` branch has a file `lib/lab4.ex` which contains some stubbed out
functions. Copy the file to `lib/` in your project and implement the functions.

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

Getting started guide: http://elixir-lang.org/getting-started/introduction.html

API docs: http://elixir-lang.org/docs/stable/elixir/

  1. `spawn/1` http://elixir-lang.org/docs/stable/elixir/Kernel.html#spawn/1

  2. `send/2` http://elixir-lang.org/docs/stable/elixir/Kernel.html#send/2

  3. `receive/1` http://elixir-lang.org/docs/stable/elixir/Kernel.SpecialForms.html#receive/1

  4. `Process` http://elixir-lang.org/docs/stable/elixir/Process.html

  5. Processes http://elixir-lang.org/getting-started/processes.html


### Solution ( no peeking :) )

See `solution.ex` in the `lab4` directory.
