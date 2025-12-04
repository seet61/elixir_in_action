defmodule Chapter6.KeyValueGenServerTest do
  use ExUnit.Case
  alias Chapter6.KeyValueGenServer

  test "first" do
    {:ok, pid} = KeyValueGenServer.start()
    KeyValueGenServer.put(pid, :some_key, :some_value)
    assert :some_value == KeyValueGenServer.get(pid, :some_key)
  end

  test "second" do
    {:ok, pid} = KeyValueGenServer.start()
    Process.sleep(15000)
  end
end
