defmodule GlazeApiWeb.ImageView do
  use GlazeApiWeb, :view

  attributes [:img_url]

  has_one :glaze, 
  field: :glaze_id,
  type: "glaze",
  link: "/api/glazes/:id"

end
