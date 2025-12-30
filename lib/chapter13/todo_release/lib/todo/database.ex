defmodule Chapter13.Release.Todo.Database do
  alias Chapter13.Release.Todo
  @db_pool_size 3
  @db_folder "./persist"

  def child_spec(_) do
    File.mkdir_p!(@db_folder)

    :poolboy.child_spec(
      __MODULE__,
      [name: {:local, __MODULE__}, worker_module: Todo.DatabaseWorker, size: @db_pool_size],
      [@db_folder]
    )
  end

  def store_local(key, data) do
    :poolboy.transaction(
      __MODULE__,
      fn worker_pid -> Todo.DatabaseWorker.store(worker_pid, key, data) end
    )
  end

  def store(key, data) do
    # вызов локальных функций сохранения
    {_results, bad_nodes} =
      :rpc.multicall(
        __MODULE__,
        :store_local,
        [key, data],
        :timer.seconds(5)
      )

    # журналирование результатов неуспешных операций
    Enum.each(
      bad_nodes,
      fn node -> IO.puts("Store failed on node #{node}") end
    )

    :ok
  end

  def get(key) do
    :poolboy.transaction(
      __MODULE__,
      fn worker_pid -> Todo.DatabaseWorker.get(worker_pid, key) end
    )
  end
end
