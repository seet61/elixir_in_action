defmodule TodoAppTest do
  use ExUnit.Case
  alias Chapter11.Application.Todo

  test "server_process" do
    # Chapter11.Application.Todo.Application.start(nil, nil)
    bobs_pid = Todo.Cache.server_process("bob")

    assert bobs_pid != Todo.Cache.server_process("alice")
    assert bobs_pid == Todo.Cache.server_process("bob")
  end
end
