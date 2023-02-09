defmodule Concord.SiteTest do
  use Concord.DataCase
  alias Concord.Site

  describe "photos" do
    @valid_attrs %{
      title: "some title",
      description: "some description",
      description_html: "<p>some description</p>",
      taken: DateTime.utc_now(),
      views: 0,
      reticulum_key: "asdf",
      extension: ".jpg"
    }

    def photo_fixture(attrs \\ %{}) do
      {:ok, photo} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Site.raw_create_photo()
      photo
    end

    test "list_photos/0 returns empty list when no photos" do
      assert Site.list_photos() == []
    end

    test "list_photos/0 returns all images" do
      assert Site.list_photos() == []
      photo = photo_fixture()
      assert Site.list_photos() == [photo]
    end

    test "count_photos/0 returns 0 when no images" do
      assert Site.count_photos() == 0
    end

    test "count_photos/0 returns accurate number" do
      assert Site.count_photos() == 0
      photo_fixture()
      assert Site.count_photos() == 1
    end

  end
end
