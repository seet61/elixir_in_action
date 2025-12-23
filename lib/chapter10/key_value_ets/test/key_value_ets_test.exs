defmodule KeyValueEtsTest do
  use ExUnit.Case

  test "first" do
    KeyValueEts.KeyValueEts.start_link()
    KeyValueEts.KeyValueEts.put(:some_key, :some_value)
    assert :some_value == KeyValueEts.KeyValueEts.get(:some_key)
  end
end
