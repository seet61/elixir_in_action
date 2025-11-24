defmodule Chapter3.StreamExampleTest do
  use ExUnit.Case

  test "stream example" do
    [9, -1, "foo", 25, 49]
    |> Stream.filter(&(is_number(&1) and &1 > 0))
    |> Stream.map(&{&1, :math.sqrt(&1)})
    |> Stream.with_index()
    |> Enum.each(fn {{input, result}, index} ->
      IO.puts("#{index + 1}. sqrt(#{input}) = #{result}")
    end)
  end

  test "stream for filtering rows large than 80 sym" do
    assert Chapter3.StreamExample.large_lines!("test/chapter3/text.txt") == :ok
  end

  test "lines_lengths" do
    assert Chapter3.StreamExample.lines_lengths!("test/chapter3/text.txt") == [
             56,
             59,
             79,
             28,
             31,
             59,
             33,
             54,
             32,
             0,
             47,
             61,
             65,
             57,
             39,
             23,
             66,
             51,
             42,
             51,
             93,
             47,
             59,
             79
           ]
  end

  test "longest_line_length" do
    assert Chapter3.StreamExample.longest_line_length!("test/chapter3/text.txt") == 93
  end

  test "longest_line" do
    assert Chapter3.StreamExample.longest_line!("test/chapter3/text.txt") ==
             "Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas."
  end

  test "words_per_line" do
    assert Chapter3.StreamExample.words_per_line!("test/chapter3/text.txt") == [
             8,
             10,
             12,
             4,
             4,
             9,
             4,
             9,
             4,
             0,
             7,
             10,
             9,
             10,
             7,
             4,
             10,
             7,
             6,
             6,
             13,
             6,
             9,
             10
           ]
  end
end
