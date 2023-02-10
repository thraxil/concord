defmodule Concord.AlbumPhoto do
  use Ecto.Schema
  import Ecto.Changeset

  schema "album_photos" do

    field :photo_id, :id
    field :album_id, :id
    field :_order, :integer
  end

  @doc false
  def changeset(album_photo, attrs) do
    album_photo
    |> cast(attrs, [])
    |> validate_required([])
  end
end
