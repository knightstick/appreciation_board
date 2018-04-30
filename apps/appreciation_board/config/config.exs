use Mix.Config

config :appreciation_board, ecto_repos: [AppreciationBoard.Repo]

import_config "#{Mix.env}.exs"
