defmodule GlazeApi.Api.Glaze do
  use Ecto.Schema
  import Ecto.Changeset

  alias GlazeApi.Repo
  alias GlazeApi.Api.{Ingredient, Image}

  schema "glazes" do
    field :name, :string
    field :temp, :integer
    field :atmosphere, :string
    field :kind, :string
    field :description, :string
    field :firing, :string
    field :misc, :string

    has_many(:ingredients, Ingredient)
    has_many(:images, Image)

    timestamps()
  end

  @doc false
  def changeset(glaze, attrs) do
    glaze
    |> Repo.preload([:images, :ingredients])
    |> cast(attrs, [
      :name,
      :temp,
      :atmosphere,
      :kind,
      :description,
      :firing,
      :misc,
      :images,
      :ingredients
    ])
    |> cast_assoc([:images, :ingredients])
    |> validate_required([
      :name,
      :temp,
      :atmosphere,
      :kind,
      :description,
      :firing,
      :misc,
      :ingredients
    ])
  end
end
