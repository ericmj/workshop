# Lab3

### Lab purpose

In this lab, you will build an API to work with the data structures we explored for Lab 2. We will implement our chat room features with an API that works with data structures we set up for Lab 2. Each of our APIs will transform a chat room, building a new one. These are the functions you'll work on: 

* `has_member?()` will return true if a chatroom has a member
* `join()` will add a new member to the chatroom
* `leave()` will remove a member from the chatroom
* `members()` will return the member names in the chatroom
* `send_message()` will add a new message to the message list for a user 
* `send_messages()` will add a new message to the message list for a user 

If you have more time, you can implement two other functions, which filter through messages in the chatroom. 

* `messages_from_user()` and `messages_to_user()` will list all of the messages from or to a given user. 

### Lab instructions

Clone `lab3` from git if you haven't already done so. 

The `lab3` directory has a file `lib/lab3.ex` which contains an implementation of chat
room with some stubbed out functions. These are the functions you'll implement. For each 
new function, you will: 

  1. run `mix test`. You will see the failures for each of your unimplemented features. 

  2. Implement the missing feature, and iterate on it until the test passes. 


### Links

Getting started guide: http://elixir-lang.org/getting-started/introduction.html

API docs: http://elixir-lang.org/docs/stable/elixir/

  1. Maps http://elixir-lang.org/getting-started/maps-and-dicts.html

  2. Map syntax http://elixir-lang.org/docs/master/elixir/Kernel.SpecialForms.html#%{}/1

  3. Structs http://elixir-lang.org/getting-started/struct.html

  4. `raise/1` http://elixir-lang.org/docs/stable/elixir/Kernel.html#raise/1

  5. `assert_raise/1` http://elixir-lang.org/docs/stable/ex_unit/ExUnit.Assertions.html#assert_raise/2

  6. `Enum.flat_map/2` http://elixir-lang.org/docs/stable/elixir/Enum.html#flat_map/2

  7. `for` comprehensions http://elixir-lang.org/docs/stable/elixir/Kernel.SpecialForms.html#for/1


### Solution ( no peeking :) )

See `solution.ex` in the `lab3` directory.
