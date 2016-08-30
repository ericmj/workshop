# Lab5

### Lab purpose

This lab will expand on the second lab. An `Agent` will be used to wrap the room
state in a process.

Some of your code can be reused from the second lab or you can grab the code
from the file with solutions in the `lab3` directory.


### Lab instructions

Create a new mix project with `mix new lab5`.

The `lab5` branch has a file `lib/lab5.ex` which contains an implementation of chat
room with some stubbed out functions. Copy the file to `lib/` in your project.
Implement the functions.

  1. Implement the `leave/2` function.

  2. Implement the `members/1` function, it should return a list of members in the
     room.

  3. Implement the `new_message/3` function.

  4. Implement the `messages_to_user/2` function.

  5. Implement the `messages_from_user/2` function.


##### Advanced user problems (if you have more time)

  1. If there is enough time try to implement the process as a `GenServer` or
     as a normal process with spawn/send/receive. What differences do you notice
     from the `Agent` version and when would you use an Agent instead of
     GenServer?

### Links

Getting started guide: http://elixir-lang.org/getting-started/introduction.html

API docs: http://elixir-lang.org/docs/stable/elixir/

  1. Agent http://elixir-lang.org/getting-started/mix-otp/agent.html

  2. `Agent` http://elixir-lang.org/docs/stable/elixir/Agent.html

  3. GenServer http://elixir-lang.org/getting-started/mix-otp/genserver.html

  4. `GenServer` http://elixir-lang.org/docs/stable/elixir/GenServer.html


### Solution ( no peeking :) )

See `solution.ex` in the `lab5` directory.
