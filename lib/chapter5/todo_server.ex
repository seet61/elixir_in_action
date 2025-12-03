defmodule Chapter5.TodoServer do
  alias Chapter4.TodoList

  def start do
    spawn(fn -> loop(TodoList.new()) end)
  end

  defp loop(todo_list) do
    new_todo_list =
      receive do
        message -> process_message(todo_list, message)
      end

    loop(new_todo_list)
  end

  # функции интерфейса
  def add_entry(todo_server, new_entry) do
    send(todo_server, {:add_entry, new_entry})
  end

  def entries(todo_server) do
    send(todo_server, {:entries, self()})

    receive do
      {:todo_entries, entries} ->
        entries
    after
      5000 -> {:error, :timeout}
    end
  end

  def entries(todo_server, date) do
    send(todo_server, {:entries, self(), date})

    receive do
      {:todo_entries, entries} ->
        entries
    after
      5000 -> {:error, :timeout}
    end
  end

  def update_entry(todo_server, id, updater_fun) do
    send(todo_server, {:update_entry, id, updater_fun})
  end

  def delete_entry(todo_server, id) do
    send(todo_server, {:delete_entry, id})
  end

  # обработка
  defp process_message(todo_list, {:add_entry, new_entry}) do
    TodoList.add_entry(todo_list, new_entry)
  end

  defp process_message(todo_list, {:entries, caller}) do
    send(caller, {:todo_entries, TodoList.entries(todo_list)})
    todo_list
  end

  defp process_message(todo_list, {:entries, caller, date}) do
    send(caller, {:todo_entries, TodoList.entries(todo_list, date)})
    todo_list
  end

  defp process_message(todo_list, {:update_entry, id, updater_fun}) do
    TodoList.update_entry(todo_list, id, updater_fun)
  end

  defp process_message(todo_list, {:delete_entry, id}) do
    TodoList.delete_entry(todo_list, id)
  end
end
