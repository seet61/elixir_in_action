defmodule Chapter11.Application.Todo.ProcessRegistry do
  def start_link do
    Registry.start_link(keys: :unique, name: __MODULE__)
  end

  def via_tiple(key) do
    {:via, Registry, {__MODULE__, key}}
  end

  # спецификация потомка
  def child_spec(_) do
    Supervisor.child_spec(
      Registry,
      id: __MODULE__,
      start: {__MODULE__, :start_link, []}
    )
  end
end
