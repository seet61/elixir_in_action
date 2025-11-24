defmodule Chapter4.FractionTest do
  alias Chapter4.Fraction
  use ExUnit.Case

  test "check struct" do
    one_half = %Chapter4.Fraction{a: 1, b: 2}

    assert 1 == one_half.a
    assert 2 == one_half.b
  end

  test "functions for struct" do
    assert Chapter4.Fraction.add(Fraction.new(1, 2), Fraction.new(1, 4))
           |> Fraction.value() == 0.75
  end
end
