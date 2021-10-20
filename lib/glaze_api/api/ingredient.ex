defmodule GlazeApi.Api.Ingredient do
  use Ecto.Schema
  import Ecto.Changeset

  # @primary_key {:ingredient_id, :id, autogenerate: true}
  schema "ingredients" do
    field :amount, :decimal
    field :name, :string
    belongs_to :glazes, GlazeApi.Api.Glaze, foreign_key: :glaze_id

    timestamps()
  end
   @doc false
  def changeset(ingredient, attrs) do
    ingredient
    |> cast(attrs, [:amount, :name, :glaze_id])
    |> validate_required([:amount, :name, :glaze_id])
  end

end
