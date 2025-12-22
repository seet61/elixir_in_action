defmodule Chapter10.Todo.Metrics do
  use Task

  def start_link(_arg) do
    Task.start_link(loop())
  end

  defp loop() do
    Process.sleep(:timer.seconds(10))
    IO.inspect(collect_metrics())
    loop()
  end

  defp collect_metrics() do
    [
      memoty_usage: :erlang.memory(:total),
      process_count: :erlang.system_info(:process_count)
    ]
  end
end
