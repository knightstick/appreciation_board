defmodule AppreciationBoard.Repo.Migrations.CreateAppreciations do
  use Ecto.Migration

  def change do
    create table(:appreciations, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :body, :string, null: false
      add :board_id, references(:boards, on_delete: :delete_all, type: :binary_id), null: false

      timestamps()
    end

    create index(:appreciations, [:board_id])
  end
end
