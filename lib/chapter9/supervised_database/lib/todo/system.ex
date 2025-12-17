defmodule Chapter9.Todo.System do
  alias Chapter9.Todo
  use Supervisor

  # def start_link do
  #  Supervisor.start_link(
  #    [Todo.Cache],
  #    strategy: :one_for_one
  #  )
  # end

  # Запуск супервизора с модулем обратного вызова Todo.Cache
  def start_link do
    Supervisor.start_link(__MODULE__, nil)
  end

  # Реализация необходимой функции обратного вызова
  def init(_) do
    Supervisor.init(
      [
        Todo.Database,
        Todo.Cache
      ],
      strategy: :one_for_one
    )
  end
end
