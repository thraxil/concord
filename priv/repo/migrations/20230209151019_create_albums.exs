defmodule Concord.Repo.Migrations.CreateAlbums do
  use Ecto.Migration

  def change do
    create table(:albums) do
      add :title, :string
      add :description, :string
      add :description_html, :string

      timestamps()
    end
  end
end
