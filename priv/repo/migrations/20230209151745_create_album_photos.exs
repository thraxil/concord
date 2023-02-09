defmodule Concord.Repo.Migrations.CreateAlbumPhotos do
  use Ecto.Migration

  def change do
    create table(:album_photos) do
      add :photo_id, references(:photos, on_delete: :nothing)
      add :album_id, references(:albums, on_delete: :nothing)
    end

    create index(:album_photos, [:photo_id])
    create index(:album_photos, [:album_id])
  end
end
