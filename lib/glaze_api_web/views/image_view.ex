defmodule GlazeApiWeb.ImageView do
    use GlazeApiWeb, :view
    use JaSerializer.PhoenixView

    attributes([:img_url, :glaze_id])

end
