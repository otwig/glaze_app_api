defmodule GlazeApiWeb.IngredientView do
  use GlazeApiWeb, :view
  use JaSerializer.PhoenixView

  attributes([:name, :amount, :glaze_id])
end
