defmodule StatefulProcessesTest do
  use ExUnit.Case

  describe "when managing manual process" do
    test "starting the counter" do
      {:ok, counter_pid} = Counter.start(0)

      assert is_pid(counter_pid)
    end

    test "getting the value" do
      {:ok, counter_pid} = Counter.start(0)

      assert {:ok, 0} == Counter.get_value(counter_pid)
    end

    test "increment the value" do
      {:ok, counter_pid} = Counter.start(0)

      :ok = Counter.increment(counter_pid)

      assert {:ok, 1} == Counter.get_value(counter_pid)
    end

    test "decrement the value" do
      {:ok, counter_pid} = Counter.start(1)

      :ok = Counter.decrement(counter_pid)

      assert {:ok, 0} == Counter.get_value(counter_pid)
    end
  end

  describe "when managing process via agent" do
    test "starting the counter" do
      {:ok, counter_pid} = CounterWithAgent.start(0)

      assert is_pid(counter_pid)
    end

    test "getting the value" do
      {:ok, counter_pid} = CounterWithAgent.start(0)

      assert {:ok, 0} == CounterWithAgent.get_value(counter_pid)
    end

    test "increment the value" do
      {:ok, counter_pid} = CounterWithAgent.start(0)

      :ok = CounterWithAgent.increment(counter_pid)

      assert {:ok, 1} == CounterWithAgent.get_value(counter_pid)
    end

    test "decrement the value" do
      {:ok, counter_pid} = CounterWithAgent.start(1)

      :ok = CounterWithAgent.decrement(counter_pid)

      assert {:ok, 0} == CounterWithAgent.get_value(counter_pid)
    end
  end
end
