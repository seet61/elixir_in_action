defmodule Chapter6.TodoGenServer do
  use GenServer
  alias Chapter6.TodoGenList

  def start do
    GenServer.start(TodoGenList, nil)
  end

  def add_entry(pid, entry) do
    GenServer.cast(pid, {:put, entry})
  end

  def get(pid, entry_id) do
    GenServer.call(pid, {:get, entry_id})
  end

  def get(pid) do
    GenServer.call(pid, {:get})
  end

  def update_entry(pid, entry_id, updater_fun) do
    GenServer.cast(pid, {:update, entry_id, updater_fun})
  end

  def delete_entry(pid, entry_id) do
    GenServer.cast(pid, {:delete, entry_id})
  end
end
