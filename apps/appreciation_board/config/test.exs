use Mix.Config

# Configure your database
config :appreciation_board, AppreciationBoard.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "appreciation_board_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
