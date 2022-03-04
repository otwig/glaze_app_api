defmodule GlazeApi.Api.Glaze do
  use Ecto.Schema
  use GlazeApiWeb, :model
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
    field :color, :string

    has_many(:ingredients, Ingredient)
    has_many(:images, Image)

    timestamps()
  end

  @castable [ 
    :name,
    :temp,
    :atmosphere,
    :kind,
    :description,
    :firing,
    :misc,
    :color
  ]

  @required [ 
    :name,
    :temp,
    :atmosphere,
    :ingredients
  ]

  @doc false
  def changeset(glaze_struct, attrs) do
    glaze_struct
    |> Repo.preload([:images, :ingredients])
    |> cast(attrs, @castable)
    |> cast_assoc([:images, :ingredients])
    |> validate_required(@required)
  end


end
