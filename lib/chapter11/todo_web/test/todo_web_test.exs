defmodule TodoWebTest do
  use ExUnit.Case

  test "init" do
    Process.sleep(10_000)
  end

  test "check test port" do
    assert 5455 == Application.get_env(:todo_web, :http_port)
  end
end
