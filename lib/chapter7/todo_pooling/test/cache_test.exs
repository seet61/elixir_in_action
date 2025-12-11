defmodule Todo.CacheTest do
  use ExUnit.Case

  test "start check" do
    {:ok, cache} = Todo.Cache.start()
    bobs_list = Todo.Cache.server_process(cache, "bobs_list")
    Todo.Server.add_entry(bobs_list, %{date: ~D[2018-12-19], title: "Dentist"})

    Process.sleep(1000)
  end

  test "cache check" do
    {:ok, cache} = Todo.Cache.start()
    bobs_list = Todo.Cache.server_process(cache, "bobs_list")

    assert [%{date: ~D[2018-12-19], id: 1, title: "Dentist"}] ==
             Todo.Server.entries(bobs_list, ~D[2018-12-19])

    Process.sleep(1000)
  end

  test "cache delete check" do
    {:ok, cache} = Todo.Cache.start()
    bobs_list = Todo.Cache.server_process(cache, "bobs_list")
    Todo.Server.delete_entry(bobs_list, 2)

    assert [%{date: ~D[2018-12-19], id: 1, title: "Dentist"}] ==
             Todo.Server.entries(bobs_list, ~D[2018-12-19])

    Process.sleep(1000)
  end
end
