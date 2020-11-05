# Stack

**Implementation of the Stack data structure using GenServer**

## Installation

The file `.tool-versions` for [asdf](https://github.com/asdf-vm/asdf) contains the Elixir version to use: `1.11.1`.

## Playing with the application

Through the `Stack` module to call the API methods that encapsulate the
OTP/GenServer calls:

```elixir
iex(1)> {:ok, stack} = Stack.start_link([])
{:ok, #PID<0.180.0>}
iex(2)> Stack.push(stack, 3)
:ok
iex(3)> Stack.push(stack, 6)
:ok
iex(4)> Stack.push(stack, 1)
:ok
iex(5)> Stack.pop(stack)
1
iex(6)> Stack.state(stack)
[6, 3]
```

## Running tests

Run `mix test` :

```
➜  stack (master) ✗ mix test
.........

Finished in 0.04 seconds
9 tests, 0 failures

Randomized with seed 404803
```
