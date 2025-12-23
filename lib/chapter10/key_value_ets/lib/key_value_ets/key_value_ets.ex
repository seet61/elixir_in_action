defmodule KeyValueEts.KeyValueEts do
  use GenServer

  def start_link do
    # запуск процессе владельца
    GenServer.start_link(__MODULE__, nil, name: __MODULE__)
  end

  def init(_) do
    # создание таблицы ets
    :ets.new(
      __MODULE__,
      [:named_table, :public, write_concurrency: true]
    )

    {:ok, nil}
  end

  def put(key, value) do
    # добавление пары ключ значние
    :ets.insert(__MODULE__, {key, value})
  end

  def get(key) do
    # поиск по ключу
    case :ets.lookup(__MODULE__, key) do
      # данные найдены
      [{^key, value}] -> value
      # данные не найдены
      [] -> nil
    end
  end
end
