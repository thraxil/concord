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

  # expects reticulum_key and extension to be set
  def raw_create_photo(attrs \\ %{}) do
    %Photo{}
    |> Photo.changeset(attrs)
    |> Repo.insert()
  end
end
