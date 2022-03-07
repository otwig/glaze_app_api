defmodule GlazeApi.Glaze do
  use Ecto.Schema
  use GlazeApiWeb, :model

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
    :ingredient_id
  ]

  @doc false
  def changeset(glaze, attrs) do
    glaze
    |> cast(attrs, @castable)
    |> validate_required(@required)
    |> assoc_constraint(:ingredient)
    |> foreign_key_constraint(:ingredient_id)
    |> validate_inclusion(:temp, 0..20)
  end
  
  # |> cast_assoc(:ingredients, with: &ingredient_changeset/2)


end
