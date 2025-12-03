defmodule Chapter5.ProcessBottleneckTest do
  use ExUnit.Case
  alias Chapter5.ProcessBottleneck

  test "test bottleneck" do
    server = ProcessBottleneck.start()

    Enum.each(
      1..5,
      fn i ->
        # конкурентные клиенты
        spawn(fn ->
          IO.inspect("Sending message ##{i}")
          response = ProcessBottleneck.send_msg(server, i)
          IO.inspect("Response: #{response}")
        end)
      end
    )

    Process.sleep(6000)
  end
end
