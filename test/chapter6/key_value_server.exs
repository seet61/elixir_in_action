defmodule Chapter6.KeyValueServerTest do
  use ExUnit.Case
  alias Chapter6.KeyValueServer

  test "first" do
    pid = KeyValueServer.start()
    KeyValueServer.put_call(pid, :some_key, :some_value)
    assert :some_value == KeyValueServer.get(pid, :some_key)
  end

  test "second" do
    pid = KeyValueServer.start()
    KeyValueServer.put_cast(pid, :some_key, :some_value)
    assert :some_value == KeyValueServer.get(pid, :some_key)
  end
end
