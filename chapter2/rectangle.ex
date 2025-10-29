defmodule Rectangle do
  # def area(a), do: area(a, a)

  def area(a, b \\ 0) do
    area_private(a, b)
  end

  defp area_private(a, b) do
    a * b
  end
end
