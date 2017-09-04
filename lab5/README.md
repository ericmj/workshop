# Lab5

## Lab purpose

In this lab we will build the chat room from lab 3 into a process with the help
of what we learned in lab 4. Instead of storing the messages inside the chat room
we will use a push/broadcast design where the messages are sent directly to the
clients which are their own processes.

The main process, the one we will be working on, holds the state of the chat room.
Again it will be a `%Lab5.Chat{}` struct with a single field `:members`. The members
field will hold a map where the key is the user name and the value is the `pid`
of the user process, `%{username => pid}`.

This is how chats are usually modeled in Elixir, you have a process for each user,
this process could also manage the socket connection between the user and the server.
And you have a single process that orchestrates the message passing between users
in a chat room, this is the process we will be working on and the client processes
will be handled in the tests.

We will keep the public function from lab 3, but instead of the implementation
being in the function itself they will send a message to the chat room process.
Check out `lib/lab5.ex` for examples.

## Lab instructions

As usual, in the directory `lab5`, you'll see a file called `lib/lab5.ex` with
several stubbed out functions. You can run your tests using `mix test`, and
implement the stubbed out functions until all of your tests pass.

Since the implementation is inside a separate process we don't want to raise if
a user is trying to join that has already joined and respectively for leaving.
Instead the functions should return `:ok` or `{:error, message}` when an invalid
username is given and the process should continue.

## Links

* Getting started guide: https://elixir-lang.org/getting-started/introduction.html

* API docs: https://hexdocs.pm/elixir/

## Solution ( no peeking :) )

See `solution.ex` in the `lab5` directory.
