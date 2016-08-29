# LAB6

### Lab purpose

In this lab we will use Blacksmith to test models.


### Lab instructions

Check out the `lab6` branch. In this branch we have provided three basic models,
`Message`, `User` and `Room`. Study the models because in this lab we are going
to test them.

  1. Implement the test `should have no members`.

  2. Implement the setup for context `with two members jane and bob`. Create two
     users "jane" and "bob", join the room and add them to the context so that
     they can be used in further tests.

  3. Implement the test `should have joined members`. (TIP: assert that the users
     in the context are members of the room with the `in/2` operator)

  4. Implement the test `should have messages in room`.

##### Advanced user problems (if you have more time)

  1. Create a test that verifies that the `:bob_msg_2` message is not in our
     room.

### Links

Getting started guide: http://elixir-lang.org/getting-started/introduction.html

API docs: http://elixir-lang.org/docs/stable/elixir/

  1. Blacksmith http://hexdocs.pm/blacksmith/

  2. Structs http://elixir-lang.org/getting-started/struct.html


### Solution ( no peeking :) )

See `solution.ex` in the `lab6` branch.
