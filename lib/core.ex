defmodule Stack.Core do
  def push(stack, element) when is_list(stack), do: [element | stack]
  def pop([head | tail]), do: {head, tail}
end
