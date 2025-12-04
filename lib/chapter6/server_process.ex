defmodule Chapter6.ServerProcess do
  def start(callback_module) do
    spawn(fn ->
      # использование обратного вызова для инициализации состояния
      initial_state = callback_module.init()
      loop(callback_module, initial_state)
    end)
  end

  defp loop(callback_module, current_state) do
    receive do
      {:call, request, caller} ->
        # использование функции обратного вызова для обработки сообщения
        {response, new_state} =
          callback_module.handle_call(
            request,
            current_state
          )

        # отправка ответа
        send(caller, {:response, response})

        # запуск цикла с новым состоянием
        loop(callback_module, new_state)

      {:cast, request} ->
        new_state =
          callback_module.handle_cast(
            request,
            current_state
          )

        loop(callback_module, new_state)
    end
  end

  @doc """
  функция отправки запросов серверу на обработку
  """
  def call(server_pid, request) do
    send(server_pid, {:call, request, self()})

    receive do
      {:response, response} ->
        response
    end
  end

  def cast(server_pid, request) do
    send(server_pid, {:cast, request})
  end
end
