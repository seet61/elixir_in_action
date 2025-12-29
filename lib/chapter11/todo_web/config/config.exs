import Config

config :todo_web,
  http_port: 5454

import_config "#{config_env()}.exs"
