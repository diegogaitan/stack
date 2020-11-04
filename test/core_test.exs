defmodule Stack.CoreTest do
  use ExUnit.Case
  alias Stack.Core

  test "push" do
    assert Core.push([1, 2, 3], 5) == [5, 1, 2, 3]
  end

  test "push on empty stack" do
    assert Core.push([], 4) == [4]
  end

  test "pop" do
    assert Core.pop([3, 4, 5]) == 3
  end
end
