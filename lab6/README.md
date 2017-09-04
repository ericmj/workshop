# Lab6

## Lab purpose

In this lab we will rebuild the chat room from the previous lab to use `GenServer`,
which is an "OTP process". An OTP process follows conventions that gives us better
error reporting, introspection into the process, and live code upgrades. It also
allows us to easily add our process to a supervision tree which is what the Elixir
fault tolerance builds on.

You will also notice that by using `GenServer` we give the code more structure
than we had before.

## Lab instructions

As usual, in the directory `lab6`, you'll see a file called `lib/lab6.ex` with
several stubbed out functions. You can run your tests using `mix test`, and
implement the stubbed out functions until all of your tests pass.

We will reuse the test suite from Lab6 since we are only changing the implementation.

## Links

* Getting started guide: https://elixir-lang.org/getting-started/introduction.html

* API docs: https://hexdocs.pm/elixir/

* `GenServer`: https://hexdocs.pm/elixir/GenServer.html

* OTP guide: https://elixir-lang.org/getting-started/TODO

## Solution ( no peeking :) )

See `solution.ex` in the `lab6` directory.
