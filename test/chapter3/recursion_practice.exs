defmodule Chapter3.RecursionPracticeTest do
  use ExUnit.Case

  # list_len
  test "length of empty list" do
    assert Chapter3.RecursionPractice.list_len([]) == 0
  end

  test "length of list" do
    assert Chapter3.RecursionPractice.list_len([1, 2, 3]) == 3
  end

  test "length of list#2" do
    assert Chapter3.RecursionPractice.list_len([3, 5, 7]) == 3
  end

  test "length of list#3" do
    assert Chapter3.RecursionPractice.list_len([1, 2, 3, 4, 5]) == 5
  end

  # range
  test "range#1" do
    assert Chapter3.RecursionPractice.range(0, 0) == [0]
  end

  test "range#2" do
    assert Chapter3.RecursionPractice.range(0, 1) == [0, 1]
  end

  test "range#3" do
    assert_raise FunctionClauseError, fn ->
      Chapter3.RecursionPractice.range(1, -1)
    end
  end

  # positive
  test "positive#1" do
    assert Chapter3.RecursionPractice.positive([-1, 0, 1]) == [1]
  end

  test "positive#2" do
    assert Chapter3.RecursionPractice.positive([1, 0, 1]) == [1, 1]
  end

  test "positive#3" do
    assert Chapter3.RecursionPractice.positive([1, 0, -1]) == [1]
  end

  test "positive#4" do
    assert Chapter3.RecursionPractice.positive([3, 2, -1, 0, 5]) == [3, 2, 5]
  end
end
