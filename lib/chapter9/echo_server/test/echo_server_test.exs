defmodule EchoServerTest do
  use ExUnit.Case

  test "init with via" do
    Registry.start_link(name: :my_registry, keys: :unique)

    EchoServer.start_link("server_1")
    EchoServer.start_link("server_2")

    IO.puts(EchoServer.call("server_1", :some_request))
    IO.puts(EchoServer.call("server_2", :another_request))
    Process.sleep(100)
  end
end
