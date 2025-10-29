defmodule Rectangle do
  import IO

  # def area(a), do: area(a, a)

  def area(a, b \\ 0) do
    area_private(a, b)
  end

  defp area_private(a, b) do
    puts("a: #{a}, b: #{b}")
    a * b
  end
end
