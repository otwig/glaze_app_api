defmodule GlazeApiWeb.IngredientView do
  use GlazeApiWeb, :view

  attributes([:name, :amount])

  has_one :glaze, 
    type: "glaze",
    link: "/api/glazes/:id",
    include: true

end
