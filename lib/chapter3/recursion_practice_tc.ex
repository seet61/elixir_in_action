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
  def range(start, stop) when start <= stop do
    do_range(start, stop)
  end

  defp do_range(start, stop) when start == stop do
    [stop]
  end

  defp do_range(start, stop) when start < stop do
    [start | do_range(start + 1, stop)]
  end

  # positive
  def positive(list) do
    do_positive(list)
  end

  defp do_positive([]) do
    []
  end

  defp do_positive([head | tail]) when head < 1 do
    positive(tail)
  end

  defp do_positive([head | tail]) when head > 0 do
    [head | positive(tail)]
  end
end
