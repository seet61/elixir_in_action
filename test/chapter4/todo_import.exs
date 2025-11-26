defmodule Chapter4.TodoList.CsvimportTest do
  use ExUnit.Case
  alias Chapter4.TodoList

  # test "import test" do
  #  assert [
  #           %{date: ~D[2018-12-19], title: "Dentist"},
  #           %{date: ~D[2018-12-20], title: "Shopping"},
  #           %{date: ~D[2018-12-19], title: "Movies"}
  #         ] == Chapter4.TodoList.Csvimport.read_todo!("test/chapter4/todos.csv")
  # end

  test "import struct" do
    todo_list =
      TodoList.new()
      |> TodoList.add_entry(%{date: ~D[2018-12-19], title: "Dentist"})
      |> TodoList.add_entry(%{date: ~D[2018-12-20], title: "Shopping"})
      |> TodoList.add_entry(%{date: ~D[2018-12-19], title: "Movies"})

    assert todo_list == Chapter4.TodoList.Csvimport.read_todo!("test/chapter4/todos.csv")
  end
end
