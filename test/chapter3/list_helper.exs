defmodule Chapter3.ListHelperTest do
  use ExUnit.Case

  test "Chapter3.ListHelper empty list" do
    assert Chapter3.ListHelper.sum([]) == 0
  end

  test "Chapter3.ListHelper empty [1, 2, 3]" do
    assert Chapter3.ListHelper.sum([1, 2, 3]) == 6
  end
end
