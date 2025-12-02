defmodule Chapter5.DatabaseServerTest do
  use ExUnit.Case
  alias Chapter5.DatabaseServer

  test "first send test" do
    server_pid = DatabaseServer.start()
    DatabaseServer.run_asunc(server_pid, "query 1")
    assert "query 1 result" == DatabaseServer.get_result()

    DatabaseServer.run_asunc(server_pid, "query 2")
    assert "query 2 result" == DatabaseServer.get_result()
  end

  test "pool of servers" do
    pool = Enum.map(1..100, fn _ -> DatabaseServer.start() end)

    Enum.each(
      1..5,
      fn query_def ->
        server_pid = Enum.at(pool, :rand.uniform(100) - 1)
        DatabaseServer.run_asunc(server_pid, query_def)
      end
    )

    test_result = ["5 result", "3 result", "1 result", "4 result", "2 result"]

    Enum.map(
      1..5,
      fn _ ->
        assert true == Enum.member?(test_result, DatabaseServer.get_result())
      end
    )
  end
end
