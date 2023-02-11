defmodule ConcordWeb.PageView do
  use ConcordWeb, :view
  alias Concord.Photo

  def thumb_url(%Photo{reticulum_key: reticulum_key, extension: extension, id: id}) do
    "https://d2f33fmhbh7cs9.cloudfront.net/image/" <> reticulum_key <> "/960w/" <> Integer.to_string(id) <> extension
  end

  def large_url(%Photo{reticulum_key: reticulum_key, extension: extension, id: id}) do
    "https://d2f33fmhbh7cs9.cloudfront.net/image/" <> reticulum_key <> "/1000w800h/" <> Integer.to_string(id) <> extension
  end
end
