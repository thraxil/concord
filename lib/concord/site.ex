defmodule Concord.Site do
  import Ecto.Changeset, only: [change: 2]
  import Ecto.Query, warn: false
  alias Concord.Repo

  alias Concord.Photo
  alias Concord.Album
  alias Concord.Tag

  def list_photos do
    Repo.all(Photo)
  end

  def newest_photos(photos_per_page, page \\ 1) do
    q = from p in Photo,
      order_by: [desc: :inserted_at, desc: :id],
      limit: ^photos_per_page,
      offset: ^((page - 1) * photos_per_page)
    Repo.all(q)
  end
  
  def count_photos do
    Repo.aggregate(Photo, :count, :id)
  end

  # expects reticulum_key and extension to be set
  def raw_create_photo(attrs \\ %{}) do
    %Photo{}
    |> Photo.changeset(attrs)
    |> Repo.insert()
  end

  def raw_create_album(attrs \\ %{}) do
    %Album{}
    |> Album.changeset(attrs)
    |> Repo.insert()
  end

  def list_albums do
    Repo.all(Album)
  end

  def raw_create_tag(attrs \\ %{}) do
    %Tag{}
    |> Tag.changeset(attrs)
    |> Repo.insert()
  end

  def list_tags do
    Repo.all(Tag)
  end

  def get_photo_by_id!(id) do
    Repo.get!(Photo, id) |> Repo.preload(:tags)
  end

  def get_tag!(name) do
    Repo.get_by!(Tag, name: name) |> Repo.preload(:photos)
  end
  
end
