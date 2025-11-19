defmodule Chapter3.NaturalNums do
  def print(n) when is_number(n) and n > 0 do
    if n > 1 do
      print(n - 1)
      IO.puts(n)
    else
      IO.puts(1)
    end
  end

  def print_reverse(n) when is_number(n) and n > 0 do
    cond do
      n > 1 ->
        IO.puts(n)
        print_reverse(n - 1)

      n == 1 ->
        IO.puts(n)
    end
  end
end
