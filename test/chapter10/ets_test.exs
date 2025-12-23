defmodule Chapter10.EtsTest do
  use ExUnit.Case

  test "check lookup" do
    todo_list = :ets.new(:todo_list, [:bag])
    :ets.insert(todo_list, {~D[2018-05-24], "Dentist"})
    :ets.insert(todo_list, {~D[2018-05-24], "Shopping"})
    :ets.insert(todo_list, {~D[2018-05-30], "Dentist"})

    assert [{~D[2018-05-24], "Dentist"}, {~D[2018-05-24], "Shopping"}] ==
             :ets.lookup(todo_list, ~D[2018-05-24])

    assert [{~D[2018-05-24], "Dentist"}, {~D[2018-05-30], "Dentist"}] ==
             :ets.match_object(todo_list, {:_, "Dentist"})
  end
end
