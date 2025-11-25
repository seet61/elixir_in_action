defmodule Chapter4.TodoListTest do
  alias Chapter4.TodoList
  use ExUnit.Case

  test "test#1" do
    todo_list =
      TodoList.new()
      |> TodoList.add_entry(%{date: ~D[2018-12-19], title: "Dentist"})
      |> TodoList.add_entry(%{date: ~D[2018-12-20], title: "Shopping"})
      |> TodoList.add_entry(%{date: ~D[2018-12-19], title: "Movies"})

    assert [
             %{id: 1, date: ~D[2018-12-19], title: "Dentist"},
             %{id: 3, date: ~D[2018-12-19], title: "Movies"}
           ] == TodoList.entries(todo_list, ~D[2018-12-19])

    assert [] == TodoList.entries(todo_list, ~D[2018-12-18])
  end

  test "test#2" do
    todo_list =
      TodoList.new()
      |> TodoList.add_entry(%{date: ~D[2018-12-19], title: "Dentist"})
      |> TodoList.add_entry(%{date: ~D[2018-12-20], title: "Shopping"})
      |> TodoList.add_entry(%{date: ~D[2018-12-19], title: "Movies"})

    todo_list = TodoList.update_entry(todo_list, 1, &Map.put(&1, :date, ~D[2018-12-20]))

    assert [
             %{id: 3, date: ~D[2018-12-19], title: "Movies"}
           ] == TodoList.entries(todo_list, ~D[2018-12-19])

    assert [
             %{id: 1, date: ~D[2018-12-20], title: "Dentist"},
             %{id: 2, date: ~D[2018-12-20], title: "Shopping"}
           ] == TodoList.entries(todo_list, ~D[2018-12-20])
  end

  test "test#3" do
    todo_list = %{
      1 => %{date: ~D[2018-12-19], title: "Dentist"},
      2 => %{date: ~D[2018-12-20], title: "Shopping"},
      3 => %{date: ~D[2018-12-19], title: "Movies"}
    }

    assert "Movies" == todo_list[3].title

    # обновление иерархической структуры через Kernel.put_in
    todo_list = put_in(todo_list[3].title, "Theater")
    assert "Theater" == todo_list[3].title
    assert "Shopping" == todo_list[2].title
  end

  test "# delete_entry/2" do
    todo_list =
      TodoList.new()
      |> TodoList.add_entry(%{date: ~D[2018-12-19], title: "Dentist"})
      |> TodoList.add_entry(%{date: ~D[2018-12-20], title: "Shopping"})
      |> TodoList.add_entry(%{date: ~D[2018-12-19], title: "Movies"})

    todo_list = TodoList.delete_entry(todo_list, 2)

    assert [
             %{id: 1, date: ~D[2018-12-19], title: "Dentist"},
             %{id: 3, date: ~D[2018-12-19], title: "Movies"}
           ] == TodoList.entries(todo_list)
  end
end
