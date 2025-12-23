defmodule Chapter10.SimpleRegistry do
  use GenServer

  def start_link() do
    GenServer.start(__MODULE__, nil, name: __MODULE__)
  end

  def init(_) do
    Process.flag(:trap_exit, true)

    # создание таблицы ets
    :ets.new(
      __MODULE__,
      [:named_table, :public, read_concurrency: true, write_concurrency: true]
    )

    {:ok, nil}
  end

  def register(name) do
    Process.link(Process.whereis(__MODULE__))

    case :ets.insert_new(__MODULE__, {name, self()}) do
      true -> :ok
      false -> :error
    end
  end

  def whereis(name) do
    # поиск по ключу
    case :ets.lookup(__MODULE__, name) do
      # данные найдены
      [{^name, value}] -> value
      # данные не найдены
      [] -> nil
    end
  end

  def handle_info({:EXIT, pid, _reason}, state) do
    :ets.match_delete(__MODULE__, {:_, pid})
    {:noreply, state}
  end
end
