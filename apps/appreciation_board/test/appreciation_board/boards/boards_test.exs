defmodule AppreciationBoard.BoardsTest do
  use AppreciationBoard.DataCase

  alias AppreciationBoard.Boards

  describe "boards" do
    alias AppreciationBoard.Boards.Board

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def board_fixture(attrs \\ %{}) do
      {:ok, board} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Boards.create_board()

      board
    end

    test "list_boards/0 returns all boards" do
      board = board_fixture()
      assert Boards.list_boards() == [board]
    end

    test "get_board!/1 returns the board with given id" do
      board = board_fixture()
      assert Boards.get_board!(board.id) == board
    end

    test "create_board/1 with valid data creates a board" do
      assert {:ok, %Board{} = board} = Boards.create_board(@valid_attrs)
      assert board.name == "some name"
    end

    test "create_board/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Boards.create_board(@invalid_attrs)
    end

    test "update_board/2 with valid data updates the board" do
      board = board_fixture()
      assert {:ok, board} = Boards.update_board(board, @update_attrs)
      assert %Board{} = board
      assert board.name == "some updated name"
    end

    test "update_board/2 with invalid data returns error changeset" do
      board = board_fixture()
      assert {:error, %Ecto.Changeset{}} = Boards.update_board(board, @invalid_attrs)
      assert board == Boards.get_board!(board.id)
    end

    test "delete_board/1 deletes the board" do
      board = board_fixture()
      assert {:ok, %Board{}} = Boards.delete_board(board)
      assert_raise Ecto.NoResultsError, fn -> Boards.get_board!(board.id) end
    end

    test "change_board/1 returns a board changeset" do
      board = board_fixture()
      assert %Ecto.Changeset{} = Boards.change_board(board)
    end
  end

  describe "appreciations" do
    alias AppreciationBoard.Boards.Appreciation

    @valid_attrs %{body: "some body"}
    @update_attrs %{body: "some updated body"}
    @invalid_attrs %{body: nil}

    def appreciation_fixture(attrs \\ %{}) do
      {:ok, appreciation} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Boards.create_appreciation()

      appreciation
    end

    test "list_appreciations/0 returns all appreciations" do
      appreciation = appreciation_fixture()
      assert Boards.list_appreciations() == [appreciation]
    end

    test "get_appreciation!/1 returns the appreciation with given id" do
      appreciation = appreciation_fixture()
      assert Boards.get_appreciation!(appreciation.id) == appreciation
    end

    test "create_appreciation/1 with valid data creates a appreciation" do
      assert {:ok, %Appreciation{} = appreciation} = Boards.create_appreciation(@valid_attrs)
      assert appreciation.body == "some body"
    end

    test "create_appreciation/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Boards.create_appreciation(@invalid_attrs)
    end

    test "update_appreciation/2 with valid data updates the appreciation" do
      appreciation = appreciation_fixture()
      assert {:ok, appreciation} = Boards.update_appreciation(appreciation, @update_attrs)
      assert %Appreciation{} = appreciation
      assert appreciation.body == "some updated body"
    end

    test "update_appreciation/2 with invalid data returns error changeset" do
      appreciation = appreciation_fixture()
      assert {:error, %Ecto.Changeset{}} = Boards.update_appreciation(appreciation, @invalid_attrs)
      assert appreciation == Boards.get_appreciation!(appreciation.id)
    end

    test "delete_appreciation/1 deletes the appreciation" do
      appreciation = appreciation_fixture()
      assert {:ok, %Appreciation{}} = Boards.delete_appreciation(appreciation)
      assert_raise Ecto.NoResultsError, fn -> Boards.get_appreciation!(appreciation.id) end
    end

    test "change_appreciation/1 returns a appreciation changeset" do
      appreciation = appreciation_fixture()
      assert %Ecto.Changeset{} = Boards.change_appreciation(appreciation)
    end
  end
end
