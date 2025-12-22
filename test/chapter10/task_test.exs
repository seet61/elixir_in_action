defmodule Chapter10.TaskTest do
  use ExUnit.Case

  test "task example" do
    long_job = fn ->
      Process.sleep(2000)
      :some_result
    end

    result = Task.async(long_job)
    IO.inspect(result)
    Process.sleep(2100)
  end

  test "run_query with Task" do
    run_query =
      fn query_def ->
        Process.sleep(2000)
        "#{query_def} result"
      end

    tasks =
      Enum.map(
        1..5,
        &Task.async(fn -> run_query.("query #{&1}") end)
      )

    IO.inspect(tasks)

    result = Enum.map(tasks, &Task.await/1)
    Process.sleep(2100)
    IO.inspect(result)
  end

  test "Task start_link" do
    Task.start_link(fn ->
      Process.sleep(1000)
      IO.puts("Hello from task")
    end)

    Process.sleep(1010)
  end
end
