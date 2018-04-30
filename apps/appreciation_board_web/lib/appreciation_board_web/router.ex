defmodule AppreciationBoardWeb.Router do
  use AppreciationBoardWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", AppreciationBoardWeb do
    pipe_through :api
  end
end
