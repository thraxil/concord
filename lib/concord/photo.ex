defmodule Concord.Photo do
  use Ecto.Schema
  import Ecto.Changeset

  schema "photos" do
    field :description, :string
    field :description_html, :string
    field :extension, :string
    field :reticulum_key, :string
    field :taken, :utc_datetime
    field :title, :string
    field :views, :integer

    timestamps()
  end

  @doc false
  def changeset(photo, attrs) do
    photo
    |> cast(attrs, [:title, :description, :description_html, :views, :reticulum_key, :extension, :taken])
    |> validate_required([:title, :description, :description_html, :views, :reticulum_key, :extension, :taken])
  end
end
