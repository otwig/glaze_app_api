defmodule GlazeApiWeb.GlazeView do
  use GlazeApiWeb, :view
  use JaSerializer.PhoenixView

  attributes([:name, :temp, :atmosphere, :kind, :description, :firing, :misc])

  has_many :ingredients,
    serializer: GlazeApi.IngredientView,
    include: false,
    identifiers: :when_included

  has_many :images,
    serializer: GlazeApi.ImageView,
    include: false,
    identifiers: :when_included
end
