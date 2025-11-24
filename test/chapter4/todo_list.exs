defmodule Chapter4.TodoListTest do
  use ExUnit.Case

  test "test#1" do
    todo_list =
      Chapter4.TodoList.new()
      |> Chapter4.TodoList.add_entry(~D[2018-12-19], "Dentist")
      |> Chapter4.TodoList.add_entry(~D[2018-12-20], "Shopping")
      |> Chapter4.TodoList.add_entry(~D[2018-12-19], "Movies")

    assert ["Movies", "Dentist"] == Chapter4.TodoList.entries(todo_list, ~D[2018-12-19])
    assert [] == Chapter4.TodoList.entries(todo_list, ~D[2018-12-18])
  end
end
