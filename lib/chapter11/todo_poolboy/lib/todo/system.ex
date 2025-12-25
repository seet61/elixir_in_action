defmodule Chapter11.PoolBoy.Todo.System do
  alias Chapter11.PoolBoy.Todo
  use Supervisor

  # Запуск супервизора с модулем обратного вызова Todo.Cache
  def start_link do
    Supervisor.start_link(__MODULE__, nil)
  end

  # Реализация необходимой функции обратного вызова
  def init(_) do
    Supervisor.init(
      [
        # Todo.Metrics,
        Todo.ProcessRegistry,
        Todo.Database,
        Todo.Cache
      ],
      strategy: :one_for_one
    )
  end
end
