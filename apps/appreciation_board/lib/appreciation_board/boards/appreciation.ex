defmodule AppreciationBoard.Boards.Appreciation do
  use Ecto.Schema
  import Ecto.Changeset


  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "appreciations" do
    field :body, :string

    belongs_to :board, AppreciationBoard.Boards.Board

    timestamps()
  end

  @doc false
  def changeset(appreciation, attrs) do
    appreciation
    |> cast(attrs, [:body, :board_id])
    |> validate_required([:body])
  end
end
