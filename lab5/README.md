# Lab5

## Lab purpose

In this lab we will build the chat room from lab 3 using concurrency instead of functions. 
We'll use the concepts we learned in lab 4. Instead of storing the messages inside `%Chat{}`, 
we will send messages directly to processes representing users. 

The main process, the one we will be working on, holds the state of the chat room.
Again it will be a `%Lab5.Chat{}` struct with a single field `:members`. The members
field will hold a map where the key is the user name and the value is the `pid`
of the user process, `%{username => pid}`.

This is how chats are usually modeled in Elixir:
* you have a process for each user
* the process manages inbound messages, perhaps from a socket
* you have a single process that orchestrates the message passing between users

In this lab, we'll shift the implementation from simple functions to the above
processes. Instead of a Phoenix client, your clients will be tests. 

## Lab instructions

As usual, in the directory `lab5`, you'll see a file called `lib/lab5.ex` with
several stubbed out functions. You can run your tests using `mix test`, and
implement the stubbed out functions until all of your tests pass.

Like most Elixir concurrent processes, instead of raising exceptions, errors 
will return {:error, "message"}. 

## Links

* Getting started guide: https://elixir-lang.org/getting-started/introduction.html

* API docs: https://hexdocs.pm/elixir/

## Solution ( no peeking :) )

See `solution.ex` in the `lab5` directory.
