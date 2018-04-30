defmodule AppreciationBoard.Application do
  @moduledoc """
  The AppreciationBoard Application Service.

  The appreciation_board system business domain lives in this application.

  Exposes API to clients such as the `AppreciationBoardWeb` application
  for use in channels, controllers, and elsewhere.
  """
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    Supervisor.start_link([
      supervisor(AppreciationBoard.Repo, []),
    ], strategy: :one_for_one, name: AppreciationBoard.Supervisor)
  end
end
