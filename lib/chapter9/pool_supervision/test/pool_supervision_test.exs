defmodule PoolSupervisionTest do
  use ExUnit.Case
  alias Chapter9.Pool.Todo

  test "init" do
    Todo.System.start_link()

    [{worker_id, _}] =
      Registry.lookup(
        Todo.ProcessRegistry,
        {Todo.DatabaseWorker, 2}
      )

    IO.puts(inspect(worker_id))
    Process.exit(worker_id, :kill)
    Process.sleep(100)
  end
end
