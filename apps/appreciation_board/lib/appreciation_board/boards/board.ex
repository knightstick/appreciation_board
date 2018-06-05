defmodule AppreciationBoard.Boards.Board do
  use Ecto.Schema
  import Ecto.Changeset


  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "boards" do
    field :name, :string

    # has_many :board, AppreciationBoard.Boards.Board

    timestamps()
  end

  @doc false
  def changeset(board, attrs) do
    board
    |> cast(attrs, [:name])
    # |> cast_assoc(:board)
    |> validate_required([:name])
  end
end
