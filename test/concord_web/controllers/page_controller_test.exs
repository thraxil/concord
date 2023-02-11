defmodule ConcordWeb.PageControllerTest do
  use ConcordWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Auratus"
  end

  test "GET /album/", %{conn: conn} do
    conn = get(conn, "/album/")
    assert html_response(conn, 200) =~ "Auratus"
    assert html_response(conn, 200) =~ "Albums"    
  end

  test "GET /tag/", %{conn: conn} do
    conn = get(conn, "/tag/")
    assert html_response(conn, 200) =~ "Auratus"
    assert html_response(conn, 200) =~ "Tags"    
  end

  test "GET /tag/:name", %{conn: conn} do
    t = Concord.MainFixtures.insert_tag()
    conn = get(conn, "/tag/" <> t.name)
    assert html_response(conn, 200) =~ "Auratus"
    assert html_response(conn, 200) =~ "Tags"
    assert html_response(conn, 200) =~ t.name
  end
  
  test "GET /photo/", %{conn: conn} do
    photo = Concord.MainFixtures.insert_photo()
    conn = get(conn, "/photo/" <> to_string(photo.id))
    assert html_response(conn, 200) =~ photo.title
  end
  
end
