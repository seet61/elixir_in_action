defmodule Chapter4.TodoList.Csvimport do
  alias Chapter4.TodoList

  def read_todo!(path) do
    File.stream!(path)
    |> Stream.map(&String.replace(&1, "\n", ""))
    |> Stream.map(&String.split(&1, ","))
    |> Stream.map(fn [date, job] ->
      {String.split(date, "/")
       |> Enum.map(&String.to_integer(&1)), job}
    end)
    |> Stream.map(fn {[year, month, day], job} ->
      {:ok, date} = Date.new(year, month, day)
      %{date: date, title: job}
    end)
    |> TodoList.new()
  end
end
