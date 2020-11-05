defmodule StackTest do
  use ExUnit.Case

  setup do
    stack = start_supervised!(
        %{
           id: Stack,
           start: {Stack, :start_link, [[]]}
         }
    )
    %{:stack => stack}
  end

  test "state", %{:stack => stack} do
    assert Stack.state(stack) == []
  end

  test "push", %{:stack => stack} do
    Stack.push(stack, 9)
    Stack.push(stack, 10)
    Stack.push(stack, 15)

    assert Stack.state(stack) == [15, 10, 9]
  end

  test "pop", %{:stack => stack} do
    Stack.push(stack, 9)
    Stack.push(stack, 10)
    Stack.push(stack, 15)

    assert Stack.pop(stack) == 15
    assert Stack.state(stack) == [10, 9]
  end


end
