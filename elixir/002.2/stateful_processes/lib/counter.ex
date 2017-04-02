defmodule Counter do
  def start(initial_value) do
    pid = spawn(__MODULE__, :loop, [initial_value])
    {:ok, pid}
  end

  def loop(value) do
    receive do
      {from, ref, :get_value} ->
        send from, {:ok, ref, value}
        loop(value)
      :increment ->
        loop(value + 1)
      :decrement ->
        loop(value - 1)
    end

  end

  def get_value(server_pid) do
    ref = make_ref()
    send server_pid, {self(), ref, :get_value}

    receive do
      {:ok, ^ref, value} -> {:ok, value}
    end
  end

  def increment(server_pid) do
    send server_pid, :increment
    :ok
  end

  def decrement(server_pid) do
    send server_pid, :decrement
    :ok
  end
end
