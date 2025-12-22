defmodule TodoMetricsTest do
  use ExUnit.Case
  alias Chapter10.Todo

  test "check metrics init" do
    Todo.System.start_link()
    # Process.sleep(30_000)
  end
end
