defmodule Chapter10.Agent.Todo.Server do
  use Agent, restart: :temporary
  alias Chapter10.Todo

  def start_link(name) do
    Agent.start_link(
      fn ->
        IO.puts("Starting todo server fot #{name}")
        {name, Todo.Database.get(name) || Todo.List.new()}
      end,
      name: via_tuple(name)
    )
  end

  defp via_tuple(name) do
    Todo.ProcessRegistry.via_tiple({__MODULE__, name})
  end

  def add_entry(todo_server, new_entry) do
    Agent.cast(todo_server, fn {name, todo_list} ->
      new_list = Todo.List.add_entry(todo_list, new_entry)
      Todo.Database.store(name, new_list)
      {name, new_list}
    end)
  end

  def entries(todo_server, date) do
    Agent.get(
      todo_server,
      fn {_name, todo_list} -> Todo.List.entries(todo_list, date) end
    )
  end
end
