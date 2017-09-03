defmodule Learned.Repo.Migrations.TilText do
  use Ecto.Migration

  def change do
    alter table(:tils) do
      modify :text, :text
    end
  end
end
