defmodule Chapter5.SpawnTest do
  use ExUnit.Case

  defp run_query(query_def) do
    Process.sleep(2000)
    "#{query_def} result"
  end

  test "function for spawn" do
    assert "query 1 result" == run_query("query 1")
  end

  test "spawn example" do
    IO.puts("spawn example")
    spawn(fn -> IO.puts(run_query("query 1")) end)
  end

  defp async_query(query_def) do
    spawn(fn -> IO.puts(run_query(query_def)) end)
  end

  test "async_query test" do
    IO.puts("async_query")
    Enum.each(1..5, &async_query("query_async #{&1}"))
  end

  test "wait async" do
    Process.sleep(2000)
  end

  test "send message" do
    send(self(), {:message, 1})

    receive_result =
      receive do
        {:message, value} ->
          value + 2
      end

    IO.inspect(receive_result)
  end
end
