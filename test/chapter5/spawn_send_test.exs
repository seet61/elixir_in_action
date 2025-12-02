defmodule Chapter5.SpawnSendTest do
  use ExUnit.Case, async_run: false
  alias Chapter5.SpawnSend

  test "async send and receive" do
    IO.inspect("async send")
    Enum.each(1..5, &SpawnSend.async_query(&1))
    IO.inspect("async sended")

    IO.inspect("async receive")
    Enum.each(1..5, fn _ -> IO.inspect(SpawnSend.get_result()) end)
    IO.inspect("async received")
    Process.sleep(2000)
  end
end
