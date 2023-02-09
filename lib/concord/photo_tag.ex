defmodule Concord.PhotoTag do
  use Ecto.Schema
  import Ecto.Changeset

  schema "photo_tags" do

    field :photo_id, :id
    field :tag_id, :id
  end

  @doc false
  def changeset(photo_tag, attrs) do
    photo_tag
    |> cast(attrs, [])
    |> validate_required([])
  end
end
