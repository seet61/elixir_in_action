# list = Enum.to_list(1..10_000)
# map_fun = fn i -> [i, i * i] end

# Benchee.run(%{
#  "flat_map" => fn -> Enum.flat_map(list, map_fun) end,
#  "map.flatten" => fn -> list |> Enum.map(map_fun) |> List.flatten() end
# })
#
{:ok, pid} = Chapter6.KeyValueGenServer.start()

Benchee.run(
  %{
    "key_value_gen.put" => fn ->
      Enum.each(
        1..10_000,
        fn item ->
          Chapter6.KeyValueGenServer.put(pid, item, item)
        end
      )
    end,
    "key_value_gen.get" => fn ->
      Enum.each(
        1..10_000,
        fn item ->
          Chapter6.KeyValueGenServer.get(pid, item)
        end
      )
    end
  },
  parallel: 100
)
