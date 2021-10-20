defmodule GlazeApi.Api.Image do
  use Ecto.Schema
  import Ecto.Changeset

  schema "images" do
    field :img_url, :string
    belongs_to :glazes, GlazeApi.Api.Glaze, foreign_key: :glaze_id

    timestamps()
  end

   @doc false
  def changeset(image, attrs) do
    image
    |> cast(attrs, [:img_url, :glaze_id])
    |> validate_required([:img_url, :glaze_id])
  end
end
