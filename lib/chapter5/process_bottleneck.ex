defmodule Chapter5.ProcessBottleneck do
  def start do
    spawn(fn -> loop() end)
  end

  defp loop do
    receive do
      {caller, message} ->
        Process.sleep(1000)
        send(caller, {:response, message})
    end

    loop()
  end

  def send_msg(server, message) do
    send(server, {self(), message})

    receive do
      {:response, response} -> response
    end
  end
end
