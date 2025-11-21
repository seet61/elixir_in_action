defmodule Chapter3.RecursionPracticeTc do
  # list_len
  def list_len(list) do
    do_len(0, list)
  end

  defp do_len(current_len, []) do
    current_len
  end

  defp do_len(current_len, [_ | tail]) do
    do_len(current_len + 1, tail)
  end

  # range
  def range(start, stop) when start == stop do
    []
  end

  def range(start, stop) when start < stop do
    [start | range(start + 1, stop)]
  end

  # positive
  def positive([]) do
    []
  end

  def positive([head | tail]) when head < 1 do
    positive(tail)
  end

  def positive([head | tail]) when head > 0 do
    [head | positive(tail)]
  end
end
