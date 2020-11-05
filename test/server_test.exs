defmodule Stack.ServerTest do
  use ExUnit.Case
  alias Stack.Server

  setup do
    server = start_supervised!({Server, []})
    %{server: server}
  end

  test "state", %{:server => server} do
    assert GenServer.call(server, :state) == []
  end

  test "push", %{:server => server} do
    GenServer.cast(server, {:push, 4})
    GenServer.cast(server, {:push, "c"})
    assert GenServer.call(server, :state) == ["c", 4]
  end

  test "pop", %{:server => server} do
    GenServer.cast(server, {:push, 8})
    GenServer.cast(server, {:push, 4})
    GenServer.cast(server, {:push, "z"})

    assert GenServer.call(server, :pop) == "z"
    assert GenServer.call(server, :state) == [4, 8]
  end
end
