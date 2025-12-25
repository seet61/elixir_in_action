defmodule Chapter11.Application.Todo.Application do
  use Application
  alias Chapter11.Application.Todo

  def start(_start_type, _start_args) do
    Todo.System.start_link()
  end
end
