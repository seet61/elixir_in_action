defmodule Chapter10.AgentTest do
  use ExUnit.Case
  use Agent

  test "agent example" do
    assert {:ok, pid} =
             Agent.start_link(fn ->
               %{name: "Bob", age: 30}
             end)

    assert pid != nil

    assert "Bob" == Agent.get(pid, fn state -> state.name end)
  end

  test "agent update state" do
    {:ok, pid} =
      Agent.start_link(fn ->
        %{name: "Bob", age: 30}
      end)

    {:ok} =
      Agent.update(
        pid,
        fn state -> %{state | age: state.age + 1} end
      )

    assert 31 == Agent.get(pid, fn state -> state.age end)
  end

  test "cuncurrent agent example" do
    {:ok, counter} =
      Agent.start_link(fn ->
        0
      end)

    # cuncurrent modification from external process
    spawn(fn ->
      Agent.update(counter, fn count -> count + 1 end)
    end)

    Process.sleep(100)
    assert 1 == Agent.get(counter, fn count -> count end)
  end
end
