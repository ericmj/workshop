# README

### Lab requirements

  1. Install git
     - Windows: Install via https://git-scm.com
     - OS X: Install with package manager or https://git-scm.com
     - Linux: Install via distribution package manager or https://git-scm.com

  2. Install Erlang & Elixir (at least 1.5)
     - See https://elixir-lang.org/install.html

##### Verify your installations

Verify your installation by calling the executables `git`, `erl` and `iex` in
your shell. Your Erlang installation needs to be on OTP 18 and Elixir on 1.5.0
or higher. Check the version by running `iex`:

```
~ λ iex
Erlang/OTP 20 [erts-9.0] [source] [64-bit] [smp:8:8] [ds:8:8:10] [async-threads:10] [hipe] [kernel-poll:false]

Interactive Elixir (1.5.1) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)>
```


### Installing a lab

The repository for all labs is found at https://github.com/ericmj/workshop.

  1. git clone from your console

        ```$ git clone https://github.com/ericmj/workshop.git```

  2. Enter the workshop directory

        ```$ cd workshop```

  2. Enter the directory for the current lab named labN

        ```$ cd labN```


### Running tests

 * Run all tests for a project: `$ mix test`

 * Run all tests in a specific file: `$ mix test test/my_test.exs`

 * Run all tests on a specific file and line: `$ mix test test/my_test.exs:42`


### Lab links

The individual labs can be found at the following URLs:

*Lab 1* - Elixir basics: https://github.com/ericmj/workshop/tree/master/lab1

*Lab 2* - Data structures and higher order functions: https://github.com/ericmj/workshop/tree/master/lab2

*Lab 3* - Implement a chat: https://github.com/ericmj/workshop/tree/master/lab3

*Lab 4* - Processes: https://github.com/ericmj/workshop/tree/master/lab4

*Lab 5* - Chat with processes: https://github.com/ericmj/workshop/tree/master/lab5

*Lab 6* - Chat with OTP: https://github.com/ericmj/workshop/tree/master/lab6
