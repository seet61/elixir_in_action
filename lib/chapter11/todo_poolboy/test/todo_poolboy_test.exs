defmodule TodoPoolboyTest do
  use ExUnit.Case
  alias Chapter11.PoolBoy.Todo

  test "pool example test" do
    Todo.Cache.server_process("alice")
    Todo.Cache.server_process("bob")
    :observer.start()
    Process.sleep(30_000)
  end
end
