defmodule Concord.Repo.Migrations.AlbumPhotosOrder do
  use Ecto.Migration

  def change do
    alter table(:album_photos) do
      add :_order, :integer
    end
  end
end
