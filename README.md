# README

### Lab requirements

  1. Install git
     - Windows: Install via http://git-scm.com
     - OS X: Install with package manager or http://git-scm.com
     - Linux: Install via distribution package manager or http://git-scm.com

  2. Install Erlang & Elixir (at least 1.3)
     - See http://elixir-lang.org/install.html

##### Verify your installations

Verify your installation by calling the executables `git`, `erl` and `iex` in
your shell. Your erlang installation needs to be on OTP 19 and Elixir on 1.3.x
or higher. Check the version by running `iex`:

```
~ λ iex
Erlang/OTP 19 [erts-8.0] [source] [64-bit] [smp:8:8] [async-threads:10] [hipe] [kernel-poll:false]

Interactive Elixir (1.3.2) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)>
```


### Installing a lab

The repository for all labs is found at https://github.com/ericmj/workshop.

  1. git clone from your console

        $ git clone git@github.com:ericmj/workshop.git

  2. Enter the workshop directory

        $ cd workshop

  2. Enter the directory for the current lab named labN

        $ cd labN


### Running tests

 * Run all tests for a project: `$ mix test`

 * Run all tests in a specific file: `$ mix test test/my_test.exs`

 * Run all tests on a specific file and line: `$ mix test test/my_test.exs:42`


### Lab links

The individual labs can be found at the following URLs:

Elixir basics: https://github.com/ericmj/workshop/tree/master/lab1

TrueStory test library: https://github.com/ericmj/workshop/tree/master/lab2

Implement a chat: https://github.com/ericmj/workshop/tree/master/lab3

Processes: https://github.com/ericmj/workshop/master/tree/lab4

Process abstractions: https://github.com/ericmj/workshop/master/tree/lab5

Chat with processes: https://github.com/ericmj/workshop/master/tree/lab6

Test coverage: https://github.com/ericmj/workshop/master/tree/lab7
