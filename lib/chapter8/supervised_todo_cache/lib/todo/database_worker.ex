defmodule Chapter8.Todo.DatabaseWorker do
  use GenServer

  def start(db_folder) do
    IO.puts("Starting todo worker for dir #{db_folder}")
    GenServer.start(__MODULE__, db_folder)
  end

  def store(worker_pid, key, data) do
    IO.puts("database worker store: #{inspect(worker_pid)}")
    GenServer.cast(worker_pid, {:store, key, data})
  end

  def get(worker_pid, key) do
    IO.puts("database worker get: #{inspect(worker_pid)}")
    GenServer.call(worker_pid, {:get, key})
  end

  @impl GenServer
  def init(db_folder) do
    File.mkdir_p!(db_folder)
    {:ok, db_folder}
  end

  @impl GenServer
  def handle_cast({:store, key, data}, db_folder) do
    IO.puts("database worker handle_cast :store #{key}: #{inspect(self())}")

    db_folder
    |> file_name(key)
    |> File.write!(:erlang.term_to_binary(data))

    {:noreply, db_folder}
  end

  @impl GenServer
  def handle_call({:get, key}, _, db_folder) do
    data =
      case File.read(file_name(db_folder, key)) do
        {:ok, contents} -> :erlang.binary_to_term(contents)
        _ -> nil
      end

    {:reply, data, db_folder}
  end

  defp file_name(db_folder, key) do
    Path.join(db_folder, to_string(key))
  end
end
