defmodule Chapter6.TodoServer do
  alias Chapter6.TodoList
  alias Chapter6.ServerProcess

  def start do
    ServerProcess.start(TodoList)
  end

  def add_entry(pid, entry) do
    ServerProcess.call(pid, {:put, entry})
  end

  def get(pid, entry_id) do
    ServerProcess.call(pid, {:get, entry_id})
  end

  def get(pid) do
    ServerProcess.call(pid, {:get})
  end

  def update_entry(pid, entry_id, updater_fun) do
    ServerProcess.call(pid, {:update, entry_id, updater_fun})
  end

  def delete_entry(pid, entry_id) do
    ServerProcess.call(pid, {:delete, entry_id})
  end
end
