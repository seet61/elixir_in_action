defmodule Chapter9.Todo.Database do
  use GenServer
  alias Chapter9.Todo

  @db_folder "./persist"

  def start_link(_) do
    IO.puts("Starting todo database")
    GenServer.start_link(__MODULE__, nil, name: __MODULE__)
  end

  def store(key, data) do
    key
    |> choose_worker()
    |> Todo.DatabaseWorker.store(key, data)
  end

  def get(key) do
    key
    |> choose_worker()
    |> Todo.DatabaseWorker.get(key)
  end

  defp choose_worker(key) do
    IO.puts("#{key} choose_worker")
    GenServer.call(__MODULE__, {:choose_worker, key})
  end

  @impl GenServer
  def init(_) do
    File.mkdir_p!(@db_folder)
    {:ok, start_workers()}
  end

  defp start_workers do
    for index <- 1..3, into: %{} do
      {:ok, pid} = Todo.DatabaseWorker.start_link(@db_folder)
      {index - 1, pid}
    end
  end

  @impl GenServer
  def handle_call({:choose_worker, key}, _, workers) do
    IO.puts("choose_worker #{inspect(workers)}")
    worker_key = :erlang.phash2(key, 3)
    IO.puts("choose_worker #{worker_key}: #{inspect(Map.get(workers, worker_key))}")
    {:reply, Map.get(workers, worker_key), workers}
  end
end
