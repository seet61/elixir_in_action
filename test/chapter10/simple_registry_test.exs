defmodule Chapter10.SimpleRegistryTest do
  use ExUnit.Case
  alias Chapter10.SimpleRegistry

  test "first" do
    assert {:ok, _} = SimpleRegistry.start_link()
    assert :ok == SimpleRegistry.register(:some_name)
    assert :error == SimpleRegistry.register(:some_name)
    assert nil != SimpleRegistry.whereis(:some_name)
    assert nil == SimpleRegistry.whereis(:inregistered_name)
  end
end
