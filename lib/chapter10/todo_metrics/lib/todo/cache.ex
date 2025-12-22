defmodule Chapter10.Todo.Cache do
  alias Chapter10.Todo

  def start_link() do
    IO.puts("Starting cache")

    DynamicSupervisor.start_link(
      name: __MODULE__,
      strategy: :one_for_one
    )
  end

  defp start_child(todo_list_name) do
    DynamicSupervisor.start_child(
      __MODULE__,
      {Todo.Server, todo_list_name}
    )
  end

  def child_spec(_arg) do
    %{
      id: __MODULE__,
      start: {__MODULE__, :start_link, []},
      type: :supervisor
    }
  end

  def server_process(todo_list_name) do
    case start_child(todo_list_name) do
      # запуск нового процесса
      {:ok, pid} -> pid
      # сервер уже запущен
      {:error, {:already_started, pid}} -> pid
    end
  end
end
