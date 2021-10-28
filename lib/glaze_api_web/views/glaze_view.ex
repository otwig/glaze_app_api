defmodule GlazeApiWeb.GlazeView do
  use GlazeApiWeb, :view
  use JaSerializer.PhoenixView

  alias GlazeApiWeb.{ImageView, IngredientView}
  alias GlazeApi.Repo

  def preload(query, _conn, _) do
    Repo.preload(query, [:ingredients, :images])
  end

  attributes [:name, :temp, :atmosphere, :kind, :description, :firing, :misc, :ingredients, :images]

    has_many :images,
    serializer: ImageView,
    include: true,
    identifiers: :always

    has_many :ingredients,
    serializer: IngredientView,
    include: true,
    identifiers: :always


end
