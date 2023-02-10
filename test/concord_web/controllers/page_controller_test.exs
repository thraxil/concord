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
  
end
