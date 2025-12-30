defmodule Chapter13.Release.Todo.Application do
  use Application
  alias Chapter13.Release.Todo

  def start(_start_type, _start_args) do
    Todo.System.start_link()
  end
end
