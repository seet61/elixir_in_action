defmodule DynamicWorkersTest do
  use ExUnit.Case
  alias Chapter9.DynamicWorkers.Todo

  test "init system" do
    Todo.System.start_link()
    Process.sleep(100)
  end

  test "init server process" do
    Todo.System.start_link()

    bobs_list = Todo.Cache.server_process("bobs_list")
    bobs_list_new = Todo.Cache.server_process("bobs_list")

    assert bobs_list == bobs_list_new
  end

  test "init different server process" do
    Todo.System.start_link()

    bobs_list = Todo.Cache.server_process("bobs_list")
    alice_list = Todo.Cache.server_process("alice_list")

    assert bobs_list != alice_list
  end

  test "restart server process" do
    Todo.System.start_link()

    bobs_list = Todo.Cache.server_process("bobs_list")
    alice_list = Todo.Cache.server_process("alice_list")
    Process.exit(bobs_list, :kill)
    bobs_list_new = Todo.Cache.server_process("bobs_list")
    alice_list_new = Todo.Cache.server_process("alice_list")

    assert bobs_list != bobs_list_new
    assert alice_list == alice_list_new
  end
end
