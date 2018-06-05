defmodule AppreciationBoard.Repo.Migrations.CreateBoards do
  use Ecto.Migration

  def change do
    create table(:boards, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string, null: false, index: true, unique: true

      timestamps()
    end
  end
end
