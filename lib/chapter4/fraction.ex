defmodule Chapter4.Fraction do
  defstruct a: nil, b: nil

  def new(a, b) do
    %Chapter4.Fraction{a: a, b: b}
  end

  def value(%Chapter4.Fraction{a: a, b: b}) do
    a / b
  end

  def add(%Chapter4.Fraction{a: a1, b: b1}, %Chapter4.Fraction{a: a2, b: b2}) do
    new(
      a1 * b2 + a2 * b1,
      b2 * b1
    )
  end
end
