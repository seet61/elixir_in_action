defmodule Chapter5.DatabaseServer do
  alias Chapter5.SpawnSend

  def start do
    # запуск в конкурентном режиме
    spawn(&loop/0)
  end

  defp loop do
    # ожидание и обработка сообщения
    receive do
      {:run_query, caller, query_def} ->
        send(caller, {:query_result, SpawnSend.run_query(query_def)})
    end

    # продолжение работы цикла
    loop()
  end

  def run_asunc(server_pid, query_def) do
    send(server_pid, {:run_query, self(), query_def})
  end

  def get_result do
    receive do
      {:query_result, result} ->
        result
    after
      5000 -> {:error, :timeout}
    end
  end
end
