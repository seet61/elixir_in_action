defmodule Chapter10.Agent.Todo.DatabaseWorker do
  use GenServer
  alias Chapter10.Agent.Todo

  def start_link({db_folder, worker_id}) do
    IO.puts("Starting database worker #{worker_id} for dir #{db_folder}")

    GenServer.start_link(
      __MODULE__,
      db_folder,
      name: via_tuple(worker_id)
    )
  end

  defp via_tuple(worker_id) do
    Todo.ProcessRegistry.via_tiple({__MODULE__, worker_id})
  end

  def store(worker_id, key, data) do
    IO.puts("database worker store: #{inspect(via_tuple(worker_id))}")
    GenServer.cast(via_tuple(worker_id), {:store, key, data})
  end

  def get(worker_id, key) do
    IO.puts("database worker get: #{inspect(via_tuple(worker_id))}")
    GenServer.call(via_tuple(worker_id), {:get, key})
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
