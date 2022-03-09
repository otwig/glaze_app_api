defmodule GlazeApi.Ingredient do
  use Ecto.Schema
  use GlazeApiWeb, :model

  alias GlazeApi.Glaze

  schema "ingredients" do
    field :amount, :decimal
    field :name, :string
    
    belongs_to :glaze, Glaze

    timestamps()
  end
   @doc false
  def changeset(ingredient, attrs) do
    ingredient
    |> cast(attrs, [:amount, :name, :glaze_id])
    |> validate_required([:amount, :name, :glaze_id])
    |> foreign_key_constraint(:glaze_id)
  end
end
