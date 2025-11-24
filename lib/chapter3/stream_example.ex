defmodule Chapter3.StreamExample do
  def large_lines!(path) do
    File.stream!(path)
    |> Stream.map(&String.replace(&1, "\n", ""))
    |> Stream.filter(&(String.length(&1) > 80))
    |> Stream.map(&{&1, String.length(&1)})
    |> Enum.each(fn {str, size} ->
      IO.puts("#{size} #{str}")
    end)
  end

  # lines_lengths!/1, принимающую на вход путь к файлу и возвращающую спи-
  # сок чисел, где каждое число – это длина соответствующей строки файла;
  def lines_lengths!(path) do
    File.stream!(path)
    |> Stream.map(&String.replace(&1, "\n", ""))
    |> Stream.map(&String.length(&1))
    |> Enum.to_list()
  end

  # longest_line_length!/1, возвращающую размер самой длинной строки;
  def longest_line_length!(path) do
    File.stream!(path)
    |> Stream.map(&String.replace(&1, "\n", ""))
    |> Stream.map(&String.length(&1))
    |> Enum.max()
  end

  # longest_line!/1, возвращающую содержимое самой длинной строки файла;
  def longest_line!(path) do
    File.stream!(path)
    |> Stream.map(&String.replace(&1, "\n", ""))
    |> Enum.max_by(&String.length(&1))
  end

  # words_per_line!/1, возвращающую список чисел, каждое из которых обозна-
  # чает количество слов в строке (чтобы посчитать слова в строке, используйте
  # функцию length(String.split(line)).
  def words_per_line!(path) do
    File.stream!(path)
    |> Stream.map(&String.replace(&1, "\n", ""))
    |> Stream.map(&length(String.split(&1)))
    |> Enum.to_list()
  end
end
