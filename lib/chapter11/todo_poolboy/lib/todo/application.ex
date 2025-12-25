defmodule Chapter11.PoolBoy.Todo.Application do
  use Application
  alias Chapter11.PoolBoy.Todo

  def start(_start_type, _start_args) do
    Todo.System.start_link()
  end
end
