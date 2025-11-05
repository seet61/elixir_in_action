defmodule Chapter3.FactTest do
  use ExUnit.Case

  test "Chapter3.Fact 1" do
    assert Chapter3.Fact.fact(1) == 1
  end

  test "Chapter3.Fact 3" do
    assert Chapter3.Fact.fact(3) == 6
  end
end
