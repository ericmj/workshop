# Lab5

## Lab purpose

In this lab we will build the chat room we prototyped in lab 3. Instead of simple funcitons, 
we'll use concurrency using the concepts we learned in lab 4. 

Our `%Chat{}` state will be simpler. It will have a `:members` field that is a map. 
The keys will be user names, and the values are processes, represented as `PID`s. 
Then we can send messages directly to each user process. 

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
