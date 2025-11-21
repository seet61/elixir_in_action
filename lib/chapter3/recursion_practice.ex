defmodule Chapter3.RecursionPractice do
  def list_len([]) do
    0
  end

  def list_len([_ | tail]) do
    1 + list_len(tail)
  end

  def range(start, stop) when start <= stop do
    cond do
      start < stop ->
        [start | range(start + 1, stop)]

      start == stop ->
        []
    end
  end

  def positive([]) do
    []
  end

  def positive([head | tail]) do
    cond do
      head > 0 ->
        [head | positive(tail)]

      head <= 0 ->
        positive(tail)
    end
  end
end
