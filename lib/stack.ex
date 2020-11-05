defmodule Stack do
  alias Stack.Server

  def start_link(initial_state) when is_list(initial_state) do
    GenServer.start_link(Server, initial_state)
  end

  def state(stack), do: GenServer.call(stack, :state)
  def push(stack, element), do: GenServer.cast(stack, {:push, element})
  def pop(stack), do: GenServer.call(stack, :pop)
end
