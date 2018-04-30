# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :appreciation_board_web,
  namespace: AppreciationBoardWeb,
  ecto_repos: [AppreciationBoard.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :appreciation_board_web, AppreciationBoardWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "G3B79tDfYG1zxNuOxOIhcc3FJBrhIxm8AWKhjZPOTDzT2JZ/Qndb3hD+ymrqqBQd",
  render_errors: [view: AppreciationBoardWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: AppreciationBoardWeb.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :appreciation_board_web, :generators,
  context_app: :appreciation_board

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
