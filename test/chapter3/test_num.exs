defmodule Chapter3.TestNumTest do
  use ExUnit.Case

  test "Chapter3.TestNumTest :negative" do
    assert Chapter3.TestNum.test(-1) == :negative
  end

  test "Chapter3.TestNumTest :zero" do
    assert Chapter3.TestNum.test(0) == :zero
  end

  test "Chapter3.TestNumTest :positive" do
    assert Chapter3.TestNum.test(1) == :positive
  end

  test "Chapter3.TestNumTest :not_number" do
    assert_raise FunctionClauseError, fn ->
      Chapter3.TestNum.test(:not_number)
    end
  end
end
