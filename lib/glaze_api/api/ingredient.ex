defmodule GlazeApi.Api.Ingredient do
  use Ecto.Schema
  import Ecto.Changeset

  alias GlazeApi.Api.Glaze

  schema "ingredients" do
    field :amount, :decimal
    field :name, :string
    belongs_to :glazes, Glaze, foreign_key: :glaze_id

    timestamps()
  end
   @doc false
  def changeset(ingredient, attrs) do
    ingredient
    |> cast(attrs, [:amount, :name, :glaze_id])
    |> validate_required([:amount, :name, :glaze_id])
    |> assoc_constraint(:glazes)
  end

end
