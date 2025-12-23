{:ok, pid} = KeyValueEts.KeyValueEts.start_link()

Benchee.run(
  %{
    "1 key_value_ets.put" => fn ->
      Enum.each(
        1..10_000,
        fn item ->
          KeyValueEts.KeyValueEts.put(item, "value_#{item}")
        end
      )
    end,
    "2 key_value_ets.get" => fn ->
      Enum.each(
        1..10_000,
        fn item ->
          KeyValueEts.KeyValueEts.get(item)
        end
      )
    end
  },
  parallel: 4
)
