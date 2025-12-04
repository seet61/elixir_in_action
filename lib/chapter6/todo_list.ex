defmodule Chapter6.TodoList do
  def init do
    Chapter4.TodoList.new()
  end

  def handle_call({:put, entry}, todo_list) do
    {:ok, Chapter4.TodoList.add_entry(todo_list, entry)}
  end

  def handle_call({:get, date}, todo_list) do
    {Chapter4.TodoList.entries(todo_list, date), todo_list}
  end

  def handle_call({:get}, todo_list) do
    {Chapter4.TodoList.entries(todo_list), todo_list}
  end

  def handle_call({:update, entry_id, updater_fun}, todo_list) do
    {:ok, Chapter4.TodoList.update_entry(todo_list, entry_id, updater_fun)}
  end

  def handle_call({:delete, entry_id}, todo_list) do
    {:ok, Chapter4.TodoList.delete_entry(todo_list, entry_id)}
  end
end
