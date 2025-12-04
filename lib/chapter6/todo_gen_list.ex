defmodule Chapter6.TodoGenList do
  use GenServer

  def init(_) do
    {:ok, Chapter4.TodoList.new()}
  end

  def handle_cast({:put, entry}, todo_list) do
    {:noreply, Chapter4.TodoList.add_entry(todo_list, entry)}
  end

  def handle_call({:get}, _, todo_list) do
    {:reply, Chapter4.TodoList.entries(todo_list), todo_list}
  end

  def handle_call({:get, date}, _, todo_list) do
    {:reply, Chapter4.TodoList.entries(todo_list, date), todo_list}
  end

  def handle_cast({:update, entry_id, updater_fun}, todo_list) do
    {:noreply, Chapter4.TodoList.update_entry(todo_list, entry_id, updater_fun)}
  end

  def handle_cast({:delete, entry_id}, todo_list) do
    {:noreply, Chapter4.TodoList.delete_entry(todo_list, entry_id)}
  end
end
