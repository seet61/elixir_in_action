defmodule Chapter3.NaturalNumsTest do
  use ExUnit.Case

  test "zero" do
    IO.puts("zero")

    assert_raise FunctionClauseError, fn ->
      Chapter3.NaturalNums.print(0)
    end
  end

  test "one" do
    IO.puts("one")
    Chapter3.NaturalNums.print(1)
  end

  test "three" do
    IO.puts("three")
    Chapter3.NaturalNums.print(3)
  end

  test "three reverse" do
    IO.puts("three reverse")
    Chapter3.NaturalNums.print_reverse(3)
  end

  test "five reverse" do
    IO.puts("five reverse")
    Chapter3.NaturalNums.print_reverse(5)
  end
end
