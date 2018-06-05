defmodule AppreciationBoardWeb.Schema.Query.AppreciationsTest do
  use AppreciationBoardWeb.ConnCase, async: true

  alias AppreciationBoard.Boards.{Appreciation, Board}

  import AppreciationBoardWeb.Factories, only: [create_board: 0, create_appreciations: 1]

  setup do
    %Board{} = board = create_board()
    [%Appreciation{} | _] = appreciations = create_appreciations(board)

    %{board: board, appreciations: appreciations}
  end

  @query """
    query($id: ID!) {
      board(id: $id) {
        id
        appreciations {
          id
          body
        }
      }
    }
  """
  test "appreciations field returns list of appreciations", %{
    board: board,
    appreciations: appreciations
  } do
    board_id = board.id
    variables = %{id: board_id}

    conn = build_conn()
    response = post(conn, "/graphql", query: @query, variables: variables)

    assert %{
             "data" => %{
               "board" => %{
                "id" => ^board_id,
                "appreciations" => appreciations_response
               }
             }
           } = json_response(response, 200)

    assert(
      Enum.map(appreciations, fn %{id: id, body: body} ->
        %{"body" => body, "id" => id}
      end) == appreciations_response
    )
  end
end
