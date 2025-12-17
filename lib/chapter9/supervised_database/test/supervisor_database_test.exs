defmodule SupervisorDatabaseTest do
  use ExUnit.Case
  alias Chapter9.Todo

  test "check supervisor for database" do
    Todo.System.start_link()
    Process.sleep(100)

    Process.exit(Process.whereis(Todo.Database), :kill)
    Process.sleep(100)
  end
end
