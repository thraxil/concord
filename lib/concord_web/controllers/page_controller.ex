defmodule ConcordWeb.PageController do
  use ConcordWeb, :controller
  alias Concord.Site

  def index(conn, _params) do
    photos_per_page = 10
    defaults = %{"page" => "1"}
    params = Map.merge(defaults, conn.query_params)
    {page, _} = Integer.parse(params["page"])
    photos_count = Site.count_photos()
    max_page = (div photos_count, photos_per_page) + 1
    photos = Site.newest_photos(photos_per_page, min(page, max_page))
    has_next = (page * photos_per_page) <= photos_count
                                                    
    render(conn,
      "index.html",
      photos: photos,
      page: min(page, max_page),
      prev_page: max(page - 1, 1),
      has_prev: page > 1,
      next_page: page + 1,
      has_next: has_next
    )
  end

  def album_index(conn, _params) do
    albums = Site.list_albums()
    render(conn, "album_index.html",
      albums: albums
    )
  end
end
