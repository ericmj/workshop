# Lab6

## Lab purpose

In this lab we will rebuild the chat room from the previous lab to use `GenServer`,
which is an "OTP process". An OTP process follows conventions that gives us better
error reporting, introspection into the process, debugging, and live code upgrades. It also
allows us to easily add our process to a supervision tree which is what the Elixir
fault tolerance builds on.

You will also notice that by using `GenServer` we give the code more structure
than we had before. Instead of having a `loop` function where we continuously loop
over the process with the process state (the chat room) and receive messages we
implement callbacks, the loop is hidden inside the `GenServer` implementation
which allows it to handle "special messages" that allows for the extra features
such as debugging and live code upgrades.

In lab5 we had the `send_and_wait_reply` function to send a message and wait for
the response, we will replace this with `GenServer.call` which does the same thing.
There is also `GenServer.cast` for sending messages where you don't expect a reply
but we will not be using this in this lab.

Each `GenServer.call` message has a corresponding implementation of the `handle_call`
callback. This callback will be called every time a "call" arrives to the process.
From the callback we need to send a reply and return the updated chat room, just like
we did in lab 5. We do this by return a `{:reply, reply, state}` tuple from the
callback where `reply` is the value you want to send back to the caller and `state`
is the new state of the process, our chat room struct. There are other return values
such as `{:noreply, state}` or `{:stop, reason, state}` when you dont want to send
a reply or stop the `GenServer` respectively, but we will only use the `:reply`
tuple.

## Lab instructions

As usual, in the directory `lab6`, you'll see a file called `lib/lab6.ex` with
several stubbed out functions. You can run your tests using `mix test`, and
implement the stubbed out functions until all of your tests pass.

We will reuse the test suite from Lab6 since we are only changing the implementation.

## Links

* Getting started guide: https://elixir-lang.org/getting-started/introduction.html

* API docs: https://hexdocs.pm/elixir/

* `GenServer`: https://hexdocs.pm/elixir/GenServer.html

TODO: Add genserver links to `handle_call` and `call`

* OTP guide: https://elixir-lang.org/getting-started/TODO

## Solution ( no peeking :) )

See `solution.ex` in the `lab6` directory.
