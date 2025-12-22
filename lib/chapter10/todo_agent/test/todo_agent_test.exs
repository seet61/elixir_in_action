defmodule TodoAgentTest do
  use ExUnit.Case
  doctest TodoAgent

  test "greets the world" do
    assert TodoAgent.hello() == :world
  end
end
