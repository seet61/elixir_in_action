defmodule Chapter6.ServerProcessTest do
  use ExUnit.Case
  alias Chapter6.ServerProcess
  alias Chapter6.KeyValueStore

  test "first" do
    pid = ServerProcess.start(KeyValueStore)
    ServerProcess.call(pid, {:put, :some_key, :some_value})
    assert :some_value == ServerProcess.call(pid, {:get, :some_key})
  end
end
