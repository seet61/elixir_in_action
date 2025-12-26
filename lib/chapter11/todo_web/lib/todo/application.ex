defmodule Chapter11.Web.Todo.Application do
  use Application
  alias Chapter11.Web.Todo

  def start(_start_type, _start_args) do
    Todo.System.start_link()
  end
end
