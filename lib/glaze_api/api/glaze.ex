defmodule GlazeApi.Api.Glaze do
  use Ecto.Schema
  import Ecto.Changeset

  schema "glazes" do
    field :name, :string
    field :temp, :integer
    field :atmosphere, :string
    field :kind, :string
    field :description, :string
    field :firing, :string
    field :misc, :string

    has_many :ingredients, GlazeApi.Api.Ingredient, foreign_key: :glaze_id
    has_many :images, GlazeApi.Api.Image, foreign_key: :glaze_id

    timestamps()
  end

  @doc false
  def changeset(glaze, attrs) do
    glaze
    |> cast(attrs, [:name, :temp, :atmosphere, :kind, :description, :firing, :misc, :ingredients, :images])
    |> validate_required([:name, :temp, :atmosphere, :kind, :description, :firing, :misc, :ingredients, :images])
  end
end
