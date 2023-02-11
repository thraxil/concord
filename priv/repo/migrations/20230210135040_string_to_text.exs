defmodule Concord.Repo.Migrations.StringToText do
  use Ecto.Migration

  def change do
    alter table(:photos) do
      modify :description, :text
      modify :description_html, :text
    end

    alter table(:albums) do
      modify :description, :text
      modify :description_html, :text
    end
  end
end
