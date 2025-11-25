defmodule Chapter4.TodoList do
  alias Chapter4.TodoList
  defstruct auto_id: 1, entries: %{}

  def new(), do: %TodoList{}

  def add_entry(todo_list, entry) do
    # установка значения новой записи
    entry = Map.put(entry, :id, todo_list.auto_id)

    # добавление новой записи в список
    new_entries = Map.put(todo_list.entries, todo_list.auto_id, entry)

    # Обновление уструктуры
    %TodoList{todo_list | entries: new_entries, auto_id: todo_list.auto_id + 1}
  end

  def entries(todo_list) do
    todo_list.entries
    |> Stream.map(fn {_, entry} -> entry end)
    |> Enum.to_list()
  end

  def entries(todo_list, date) do
    todo_list.entries
    # фильтрация по указанной дате
    |> Stream.filter(fn {_, entry} -> entry.date == date end)
    # извлечение только значений
    |> Enum.map(fn {_, entry} -> entry end)
  end

  def update_entry(todo_list, %{} = new_entry) do
    update_entry(todo_list, new_entry.id, fn _ -> new_entry end)
  end

  def update_entry(todo_list, entry_id, updater_fun) do
    case Map.fetch(todo_list.entries, entry_id) do
      :error ->
        # запись не найдена возвращаем старый список
        todo_list

      {:ok, old_entry} ->
        # запись найдена, обновляем ее
        old_entry_id = old_entry.id
        new_entry = %{id: ^old_entry_id} = updater_fun.(old_entry)
        new_entries = Map.put(todo_list.entries, new_entry.id, new_entry)
        %TodoList{todo_list | entries: new_entries}
    end
  end

  # delete_entry/2
  def delete_entry(todo_list, entry_id) do
    case Map.fetch(todo_list.entries, entry_id) do
      :error ->
        todo_list

      {:ok, _} ->
        new_entries = Map.delete(todo_list.entries, entry_id)
        %TodoList{todo_list | entries: new_entries}
    end
  end
end
