defmodule Chapter12.Distributed.Todo.Application do
  use Application
  alias Chapter12.Distributed.Todo

  def start(_start_type, _start_args) do
    Todo.System.start_link()
  end
end
