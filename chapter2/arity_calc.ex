defmodule Calculator do
  @moduledoc """
  first example with module and function
  """
  # attribute
  @pi 3.14159

  # def sum(a) do
  #  sum(a, 0)
  # end

  # replace first function default value for b
  @spec sum(number, number) :: number
  def sum(a, b \\ 0) do
    a + b
  end
end
