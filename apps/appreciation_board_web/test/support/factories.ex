defmodule AppreciationBoardWeb.Factories do
  alias AppreciationBoard.Repo
  alias AppreciationBoard.Boards.{Appreciation, Board}

  def create_board() do
    with changeset <- Board.changeset(%Board{}, %{name: Faker.App.name}),
        {:ok, board } <- Repo.insert!(changeset) do
      board
    end
  end

  def create_appreciations(board \\ nil)

  def create_appreciations(nil) do
    %Board{} = board = create_board()
    create_appreciations(board)
  end

  def create_appreciations(%Board{} = board) do
    Enum.map(1..3, fn _ -> attributes_for_appreciation() end)
    |> Enum.map(&(Map.merge(&1, %{board_id: board.id})))
    |> Enum.map(&create_appreciation/1)

    import Ecto.Query
    Repo.all(from appreciations in Appreciation, where: appreciations.board_id == ^board.id)
  end

  defp attributes_for_appreciation(attrs \\ %{}) do
    name = Faker.Name.name()
    reason = random_reason()
    body = %{body: "I appreciate #{name}, because they #{reason}!"}

    Map.merge(body, attrs)
  end

  @reasons [
    "are awesome",
    "helped out with something",
    "taught me something",
    "are such a nice person",
    "did such an amazing job"
  ]

  defp random_reason() do
    @reasons
    |> Enum.shuffle
    |> List.first
  end

  defp create_appreciation(attrs), do: AppreciationBoard.Boards.create_appreciation(attrs)
end
