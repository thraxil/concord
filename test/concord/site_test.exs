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
      reticulum_key: "e0965866227a5546cf9417fd25d5f9a278a95029",
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

    test "newest_images/2 empty list when no photos" do
      assert Site.newest_photos(10, 1) == []
    end

    test "newest_images/2 returns photos" do
      assert Site.newest_photos(10, 1) == []
      photo1 = photo_fixture(%{title: "p1"})
      assert Site.newest_photos(10, 1) == [photo1]
      photo2 = photo_fixture(%{title: "p2"})
      assert Site.newest_photos(10, 1) == [photo2, photo1]
    end

    test "get_photo_by_id!/1 returns photo" do
      photo = photo_fixture()
      r = Site.get_photo_by_id!(photo.id)
      assert photo.title == r.title
      assert photo.description == r.description
      assert photo.id == r.id
    end
  end

  describe "albums" do
    @valid_attrs %{
      title: "some title",
      description: "some description",
      description_html: "<p>some description</p>"
    }

    def album_fixture(attrs \\ %{}) do
      {:ok, album} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Site.raw_create_album()

      album
    end

    test "list_albums/0 returns empty list when no albums" do
      assert Site.list_albums() == []
    end

    test "list_albums/0 returns all albums" do
      assert Site.list_albums() == []
      album = album_fixture()
      assert Site.list_albums() == [album]
    end

    test "get_album!/1 returns album" do
      album = album_fixture()
      a = Site.get_album!(album.id)
      assert a.id == album.id
      assert a.title == album.title
      assert a.description == album.description
      assert a.description_html == album.description_html
    end
  end

  describe "tags" do
    @valid_attrs %{
      name: "tag"
    }

    def tag_fixture(attrs \\ %{}) do
      {:ok, tag} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Site.raw_create_tag()

      tag
    end

    test "list_tags/0 returns empty list when no tags" do
      assert Site.list_tags() == []
    end

    test "list_tags/0 returns all tags" do
      assert Site.list_tags() == []
      tag = tag_fixture()
      assert Site.list_tags() == [tag]
    end

    test "get_tag!/1 returns tag" do
      tag = tag_fixture()
      t = Site.get_tag!(tag.name)
      assert t.id == tag.id
      assert t.name == tag.name
    end
  end
end
