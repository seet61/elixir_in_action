import Config

config :todo_distributed,
  http_port: 5454

import_config "#{config_env()}.exs"
