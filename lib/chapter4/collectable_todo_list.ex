defimpl Collectable, for: Chapter4.TodoList do
  alias Chapter4.TodoList

  # возвращение анонимной функции выполнения
  def into(original) do
    {original, &into_callback/2}
  end

  # реализация функции добавления
  defp into_callback(todo_list, {:cont, entry}) do
    TodoList.add_entry(todo_list, entry)
  end

  defp into_callback(todo_list, :done) do
    todo_list
  end

  defp into_callback(_todo_list, :halt) do
    :ok
  end
end
