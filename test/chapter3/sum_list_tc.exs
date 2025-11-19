defmodule Chapter3.SumListTcTest do
  use ExUnit.Case

  test "empty list" do
    assert 0 == Chapter3.SumListTc.sum([])
  end

  test "not empty list" do
    assert 6 == Chapter3.SumListTc.sum([1, 2, 3])
  end
end
