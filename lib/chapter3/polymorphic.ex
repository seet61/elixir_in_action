defmodule Chapter3.Polymorphic do
  def double(x) when is_number(x) do
    2 * x
  end

  def double(x) when is_binary(x) do
    x <> x
  end
end
