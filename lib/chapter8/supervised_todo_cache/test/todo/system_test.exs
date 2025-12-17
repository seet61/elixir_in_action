defmodule Todo.SystemTest do
  use ExUnit.Case
  alias Chapter8.Todo

  test "check system start" do
    Todo.System.start_link()
    Process.sleep(100)
  end

  test "check kill linked" do
    Todo.System.start_link()
    Todo.Cache.server_process("bob_list")
    Process.sleep(300)
    IO.puts("process count: #{:erlang.system_info(:process_count)}")

    IO.puts("kill process of Todo.Cache")
    Process.exit(Process.whereis(Todo.Cache), :kill)
    Process.sleep(300)
    IO.puts("process count: #{:erlang.system_info(:process_count)}")

    Todo.Cache.server_process("bob_list")
    Process.sleep(300)
    IO.puts("process count: #{:erlang.system_info(:process_count)}")
  end
end
