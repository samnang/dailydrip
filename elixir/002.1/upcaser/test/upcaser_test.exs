defmodule UpcaserTest do
  use ExUnit.Case

  test "starting the service" do
    {:ok, upcaser_pid} = Upcaser.start

    assert {:ok, "FOO"} == Upcaser.upcase(upcaser_pid, "foo")
  end
end
