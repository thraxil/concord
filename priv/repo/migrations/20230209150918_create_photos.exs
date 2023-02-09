defmodule Concord.Repo.Migrations.CreatePhotos do
  use Ecto.Migration

  def change do
    create table(:photos) do
      add :title, :string
      add :description, :string
      add :description_html, :string
      add :views, :integer
      add :reticulum_key, :string
      add :extension, :string
      add :taken, :utc_datetime

      timestamps()
    end
  end
end
