defmodule AppreciationBoardWeb.Schema do
  use Absinthe.Schema

  alias AppreciationBoardWeb.Resolvers

  query do
    field :board, :board do
      arg :id, non_null(:id)
      resolve &Resolvers.Boards.get_board/3
    end
  end

  object :board do
    field :id, :string
    field :name, :string

    field :appreciations, list_of(:appreciation) do
      resolve &Resolvers.Boards.appreciations_for_board/3
    end
  end

  object :appreciation do
    field :id, :string
    field :body, :string

    field :board, :board do
      resolve &Resolvers.Boards.board_for_appreciation/3
    end
  end
end
