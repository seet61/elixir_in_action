defmodule Chapter11.Web.Todo.System do
  alias Chapter11.Web.Todo
  use Supervisor

  # Запуск супервизора с модулем обратного вызова Todo.Cache
  def start_link do
    Supervisor.start_link(__MODULE__, nil)
  end

  # Реализация необходимой функции обратного вызова
  def init(_) do
    Supervisor.init(
      [
        Todo.ProcessRegistry,
        Todo.Database,
        Todo.Cache,
        Todo.Web
      ],
      strategy: :one_for_one
    )
  end
end
