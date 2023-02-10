defmodule Concord.MainFixtures do
  alias Concord.Repo

  def insert_photo(attrs \\ %{}) do
    changes = Map.merge(%{
          reticulum_key: "asdfasdfasd",
          extension: ".jpg",
          title: "a photo",
          description: "a description",
          description_html: "<p>a description</p>",
          views: 0,
          taken: DateTime.utc_now(),
                         }, attrs)
    %Concord.Photo{}
    |> Concord.Photo.changeset(changes)
    |> Repo.insert!()
  end
end
