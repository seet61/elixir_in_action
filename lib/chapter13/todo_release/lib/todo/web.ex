defmodule Chapter13.Release.Todo.Web do
  use Plug.Router
  alias Chapter13.Release.Todo

  plug(:match)
  plug(:dispatch)

  def child_spec(_arg) do
    Plug.Cowboy.child_spec(
      scheme: :http,
      options: [port: Application.fetch_env!(:todo_release, :http_port)],
      plug: __MODULE__
    )
  end

  post "/add_entry" do
    # разбор входящих параметров
    conn = Plug.Conn.fetch_query_params(conn)
    IO.puts("fetch_query_params")
    IO.puts(inspect(conn))
    list = Map.fetch!(conn.params, "list")
    IO.puts("list: #{list}")
    title = Map.fetch!(conn.params, "title")
    IO.puts("title: #{title}")
    date = Date.from_iso8601!(Map.fetch!(conn.params, "date"))
    IO.puts("date: #{date}")

    # выполнение операции
    list
    |> Todo.Cache.server_process()
    |> Todo.Server.add_entry(%{title: title, date: date})

    # отправка ответа
    conn
    |> Plug.Conn.put_resp_content_type("text/plain")
    |> Plug.Conn.send_resp(200, "OK")
  end

  get "/entries" do
    conn = Plug.Conn.fetch_query_params(conn)
    IO.puts("fetch_query_params")
    IO.puts(inspect(conn))
    list = Map.fetch!(conn.params, "list")
    IO.puts("list: #{list}")
    date = Date.from_iso8601!(Map.fetch!(conn.params, "date"))
    IO.puts("date: #{date}")

    entries =
      list
      |> Todo.Cache.server_process()
      |> Todo.Server.entries(date)

    formatted_entries =
      entries
      |> Enum.map(&"#{&1.date} #{&1.title}")
      |> Enum.join("\n")

    conn
    |> Plug.Conn.put_resp_content_type("text/plain")
    |> Plug.Conn.send_resp(200, formatted_entries)
  end
end
