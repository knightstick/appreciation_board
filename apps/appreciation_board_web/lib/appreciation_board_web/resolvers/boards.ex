defmodule AppreciationBoardWeb.Resolvers.Boards do
  alias AppreciationBoard.Repo
  alias AppreciationBoard.Boards.{Appreciation, Board}

  import Ecto.Query

  def get_board(_, %{id: id}, _) do
    # This should probably use a function on Boards
    %Board{id: ^id} = board = Repo.get(Board, id)

    {:ok, board}
  end

  def appreciations_for_board(%{id: board_id}, _, _) do
    appreciations =
      from(
        appreciation in Appreciation,
        where: appreciation.board_id == ^board_id
      )
      |> Repo.all()

    {:ok, appreciations}
  end

  def board_for_appreciation(%{board_id: board_id}, _, _) do
    %Board{id: ^board_id} = board = Repo.get(Board, board_id)

    {:ok, board}
  end
end
