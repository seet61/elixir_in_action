defmodule Chapter5.CalculatorTest do
  use ExUnit.Case
  alias Chapter5.Calculator

  test "check" do
    calculator_pid = Calculator.start()

    assert 0 == Calculator.value(calculator_pid)

    Calculator.add(calculator_pid, 10)
    Calculator.sub(calculator_pid, 5)
    Calculator.mul(calculator_pid, 3)
    Calculator.div(calculator_pid, 5)

    # (((0 + 10) - 5) * 3) / 5, который равен 3
    assert 3.0 == Calculator.value(calculator_pid)
  end
end
