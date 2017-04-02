defmodule CounterWithAgent do
  def start(initial_value) do
    Agent.start(fn -> initial_value end)
  end

  def get_value(server_pid) do
    Agent.get(server_pid, fn(x) -> {:ok, x} end)
  end

  def increment(server_pid) do
    Agent.update(server_pid, fn(x) -> x + 1 end)
  end

  def decrement(server_pid) do
    Agent.update(server_pid, fn(x) -> x - 1 end)
  end
end
