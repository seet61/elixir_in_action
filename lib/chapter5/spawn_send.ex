defmodule Chapter5.SpawnSend do
  def run_query(query_def) do
    Process.sleep(2000)
    IO.inspect("send #{query_def} result")
    "#{query_def} result"
  end

  def async_query(query_def) do
    # сохранение pid вызывающего процесса
    caller = self()

    spawn(fn ->
      # отправка ответа вызывающему процессу
      send(caller, {:query_result, run_query(query_def)})
    end)
  end

  def get_result() do
    receive do
      {:query_result, result} -> result
    after
      5000 -> IO.inspect("empty")
    end
  end
end
