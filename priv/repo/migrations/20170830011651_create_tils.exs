defmodule Learned.Repo.Migrations.CreateTils do
  use Ecto.Migration

  def change do
    create table(:tils) do
      add :text, :string
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:tils, [:user_id])
  end
end
