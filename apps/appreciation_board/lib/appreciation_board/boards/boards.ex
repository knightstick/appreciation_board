defmodule AppreciationBoard.Boards do
  @moduledoc """
  The Boards context.
  """

  import Ecto.Query, warn: false
  alias AppreciationBoard.Repo

  alias AppreciationBoard.Boards.Board

  @doc """
  Returns the list of boards.

  ## Examples

      iex> list_boards()
      [%Board{}, ...]

  """
  def list_boards do
    Repo.all(Board)
  end

  @doc """
  Gets a single board.

  Raises `Ecto.NoResultsError` if the Board does not exist.

  ## Examples

      iex> get_board!(123)
      %Board{}

      iex> get_board!(456)
      ** (Ecto.NoResultsError)

  """
  def get_board!(id), do: Repo.get!(Board, id)

  @doc """
  Creates a board.

  ## Examples

      iex> create_board(%{field: value})
      {:ok, %Board{}}

      iex> create_board(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_board(attrs \\ %{}) do
    %Board{}
    |> Board.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a board.

  ## Examples

      iex> update_board(board, %{field: new_value})
      {:ok, %Board{}}

      iex> update_board(board, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_board(%Board{} = board, attrs) do
    board
    |> Board.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Board.

  ## Examples

      iex> delete_board(board)
      {:ok, %Board{}}

      iex> delete_board(board)
      {:error, %Ecto.Changeset{}}

  """
  def delete_board(%Board{} = board) do
    Repo.delete(board)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking board changes.

  ## Examples

      iex> change_board(board)
      %Ecto.Changeset{source: %Board{}}

  """
  def change_board(%Board{} = board) do
    Board.changeset(board, %{})
  end

  alias AppreciationBoard.Boards.Appreciation

  @doc """
  Returns the list of appreciations.

  ## Examples

      iex> list_appreciations()
      [%Appreciation{}, ...]

  """
  def list_appreciations do
    Repo.all(Appreciation)
  end

  @doc """
  Gets a single appreciation.

  Raises `Ecto.NoResultsError` if the Appreciation does not exist.

  ## Examples

      iex> get_appreciation!(123)
      %Appreciation{}

      iex> get_appreciation!(456)
      ** (Ecto.NoResultsError)

  """
  def get_appreciation!(id), do: Repo.get!(Appreciation, id)

  @doc """
  Creates a appreciation.

  ## Examples

      iex> create_appreciation(%{field: value})
      {:ok, %Appreciation{}}

      iex> create_appreciation(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_appreciation(attrs \\ %{}) do
    %Appreciation{}
    |> Appreciation.changeset(attrs)
    |> Repo.insert!()
  end

  @doc """
  Updates a appreciation.

  ## Examples

      iex> update_appreciation(appreciation, %{field: new_value})
      {:ok, %Appreciation{}}

      iex> update_appreciation(appreciation, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_appreciation(%Appreciation{} = appreciation, attrs) do
    appreciation
    |> Appreciation.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Appreciation.

  ## Examples

      iex> delete_appreciation(appreciation)
      {:ok, %Appreciation{}}

      iex> delete_appreciation(appreciation)
      {:error, %Ecto.Changeset{}}

  """
  def delete_appreciation(%Appreciation{} = appreciation) do
    Repo.delete(appreciation)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking appreciation changes.

  ## Examples

      iex> change_appreciation(appreciation)
      %Ecto.Changeset{source: %Appreciation{}}

  """
  def change_appreciation(%Appreciation{} = appreciation) do
    Appreciation.changeset(appreciation, %{})
  end
end
