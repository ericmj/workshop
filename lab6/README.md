# Lab6

## Lab purpose

In this lab we will rebuild the chat room from the previous lab with an OTP `GenServer`.

Notice the simplicity. The `GenServer` removes boilerplate your code would otherwise
have to handle.

You will replace the `send_and_wait_reply` function from lab5 with a `GenServer.call`.

You'll have a `handle_call` for each `GenServer.call`. OTP will call this callback
every time a "call" arrives to the process.

From the callback we need to send a reply and return the updated chat room, just like
we did in lab5. You'll do so by returning a `{:reply, reply, state}` tuple from the
callback where `reply` is the value you want to send back to the caller and `state`
is our (possibly updated) chat room struct, which becomes the new process state.

## Lab instructions

As usual, in the directory `lab6`, you'll see a file called `lib/lab6.ex` with
several stubbed out functions. You can run your tests using `mix test`, and
implement the stubbed out functions until all of your tests pass.

We will reuse the test suite from lab5 since we are only changing the implementation.

## Links

* Getting started guide: https://elixir-lang.org/getting-started/introduction.html

* API docs: https://hexdocs.pm/elixir/

* `GenServer` API: https://hexdocs.pm/elixir/GenServer.html

* `GenServer` guide: https://elixir-lang.org/getting-started/mix-otp/genserver.html

## Solution ( no peeking :) )

See `solution.ex` in the `lab6` directory.
