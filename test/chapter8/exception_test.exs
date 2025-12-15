defmodule Chapter8.ExceptionTest do
  use ExUnit.Case

  test "try example" do
    try_helper = fn fun ->
      try do
        fun.()
        IO.puts("No error")
      catch
        type, value ->
          IO.puts("Error\n #{inspect(type)}\n #{inspect(value)}")
      end
    end

    try_helper.(fn -> raise("Something went wrong") end)
    result = try_helper.(fn -> exit("Done") end)
    IO.inspect(result)
  end

  test "subprocess" do
    spawn(fn ->
      spawn(fn ->
        Process.sleep(1000)
        IO.puts("Process 2 finished")
      end)

      raise("Something went wrong")
    end)

    Process.sleep(1100)
  end

  test "subprocess with link" do
    spawn(fn ->
      spawn_link(fn ->
        Process.sleep(1000)
        IO.puts("Process 2 finished")
      end)

      raise("Something went wrong")
    end)

    Process.sleep(1100)
  end
end
