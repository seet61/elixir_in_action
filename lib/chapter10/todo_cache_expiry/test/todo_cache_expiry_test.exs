defmodule TodoCacheExpiryTest do
  use ExUnit.Case
  alias Chapter10.Expiry.Todo

  test "expiry test example" do
    Todo.System.start_link()
    pid = Todo.Cache.server_process("bobs_list")
    Process.sleep(10_100)
    assert false == Process.alive?(pid)
  end
end
