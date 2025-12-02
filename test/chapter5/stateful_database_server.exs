defmodule Chapter5.StatefulDatabaseServerTest do
  use ExUnit.Case
  alias Chapter5.StatefulDatabaseServer

  test "first send test" do
    server_pid = StatefulDatabaseServer.start()
    StatefulDatabaseServer.run_asunc(server_pid, "query 1")
    result = StatefulDatabaseServer.get_result()
    IO.inspect(result)
    assert true == String.contains?(result, "query 1 result")

    StatefulDatabaseServer.run_asunc(server_pid, "query 2")
    result = StatefulDatabaseServer.get_result()
    IO.inspect(result)
    assert true == String.contains?(result, "query 2 result")
  end
end
