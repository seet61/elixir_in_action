defmodule Chapter6.KeyValueGenServer do
  use GenServer
  alias Chapter6.KeyValueGenStore

  def start() do
    GenServer.start(KeyValueGenStore, nil)
  end

  def put(pid, key, value) do
    GenServer.cast(pid, {:put, key, value})
  end

  def get(pid, key) do
    GenServer.call(pid, {:get, key})
  end
end
