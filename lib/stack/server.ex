defmodule Stack.Server do
  use GenServer
  alias Stack.Core

  def start_link(initial) when is_list(initial) do
    GenServer.start_link(__MODULE__, initial)
  end

  # Callbacks
  @impl true
  def init(state) when is_list(state) do
    {:ok, state}
  end

  @impl true
  def handle_call(:pop, _from, state) do
    {head, tail} = Core.pop(state)
    {:reply, head, tail}
  end

  @impl true
  def handle_call(:state, _from, state) do
    {:reply, state, state}
  end

  @impl true
  def handle_cast({:push, element}, state) do
    {:noreply, Core.push(state, element)}
  end
end
