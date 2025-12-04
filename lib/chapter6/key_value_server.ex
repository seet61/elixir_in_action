defmodule Chapter6.KeyValueServer do
  alias Chapter6.ServerProcess
  alias Chapter6.KeyValueStore

  def start do
    ServerProcess.start(KeyValueStore)
  end

  def put_call(pid, key, value) do
    ServerProcess.call(pid, {:put, key, value})
  end

  def put_cast(pid, key, value) do
    ServerProcess.cast(pid, {:put, key, value})
  end

  def get(pid, key) do
    ServerProcess.call(pid, {:get, key})
  end
end
