defmodule GlazeApiWeb.GlazeView do
  use GlazeApiWeb, :view

  location("/api/glazes/:id")
  attributes([:name, :temp, :atmosphere, :kind, :description, :firing, :misc, :ingredients, :images, :color])

  def preload(query, _conn, _) do
    Repo.preload(query, [:ingredients, :images])
  end

  has_many :images,
  serializer: ImageView,
  include: true

  has_many :ingredients,
  serializer: IngredientView,
  include: true

end
