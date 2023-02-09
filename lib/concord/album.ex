defmodule Concord.Album do
  use Ecto.Schema
  import Ecto.Changeset

  schema "albums" do
    field :description, :string
    field :description_html, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(album, attrs) do
    album
    |> cast(attrs, [:title, :description, :description_html])
    |> validate_required([:title, :description, :description_html])
  end
end
