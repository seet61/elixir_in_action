defmodule Chapter5.TodoServerTest do
  use ExUnit.Case
  alias Chapter5.TodoServer

  test "check with server" do
    todo_server = TodoServer.start()

    TodoServer.add_entry(todo_server, %{date: ~D[2018-12-19], title: "Dentist"})
    TodoServer.add_entry(todo_server, %{date: ~D[2018-12-20], title: "Shopping"})
    TodoServer.add_entry(todo_server, %{date: ~D[2018-12-19], title: "Movies"})

    assert [
             %{date: ~D[2018-12-19], id: 1, title: "Dentist"},
             %{date: ~D[2018-12-19], id: 3, title: "Movies"}
           ] == TodoServer.entries(todo_server, ~D[2018-12-19])
  end

  test "update_entry" do
    todo_server = TodoServer.start()

    TodoServer.add_entry(todo_server, %{date: ~D[2018-12-19], title: "Dentist"})
    TodoServer.add_entry(todo_server, %{date: ~D[2018-12-20], title: "Shopping"})
    TodoServer.add_entry(todo_server, %{date: ~D[2018-12-19], title: "Movies"})

    TodoServer.update_entry(todo_server, 1, &Map.put(&1, :date, ~D[2018-12-20]))

    assert [
             %{id: 3, date: ~D[2018-12-19], title: "Movies"}
           ] == TodoServer.entries(todo_server, ~D[2018-12-19])

    assert [
             %{id: 1, date: ~D[2018-12-20], title: "Dentist"},
             %{id: 2, date: ~D[2018-12-20], title: "Shopping"}
           ] == TodoServer.entries(todo_server, ~D[2018-12-20])
  end

  test "delete_entry" do
    todo_server = TodoServer.start()

    TodoServer.add_entry(todo_server, %{date: ~D[2018-12-19], title: "Dentist"})
    TodoServer.add_entry(todo_server, %{date: ~D[2018-12-20], title: "Shopping"})
    TodoServer.add_entry(todo_server, %{date: ~D[2018-12-19], title: "Movies"})

    TodoServer.delete_entry(todo_server, 2)

    assert [
             %{id: 1, date: ~D[2018-12-19], title: "Dentist"},
             %{id: 3, date: ~D[2018-12-19], title: "Movies"}
           ] == TodoServer.entries(todo_server, ~D[2018-12-19])
  end
end
