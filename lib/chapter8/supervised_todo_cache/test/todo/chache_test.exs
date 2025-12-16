defmodule Chapter8.Todo.ChacheTest do
  use ExUnit.Case
  alias Chapter8.Todo

  test "test supervisor start link" do
    Supervisor.start_link([Todo.Cache], strategy: :one_for_one)
    bobs_list = Todo.Cache.server_process("bobs_list")
    Process.sleep(1000)
  end

  test "test supervisor crash start link" do
    Supervisor.start_link([Todo.Cache], strategy: :one_for_one)
    Process.sleep(500)
    cache_pid = Process.whereis(Todo.Cache)
    IO.puts("before kill #{inspect(cache_pid)}")
    Process.exit(cache_pid, :kill)
    Process.sleep(500)
    cache_pid = Process.whereis(Todo.Cache)
    IO.puts("after kill #{inspect(cache_pid)}")
  end
end
