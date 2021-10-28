defmodule GlazeApi.Api.Image do
  use Ecto.Schema
  import Ecto.Changeset

  alias GlazeApi.Api.Glaze

  schema "images" do
    field :img_url, :string
    belongs_to :glazes, Glaze, foreign_key: :glaze_id

    timestamps()
  end

  @doc false
  def changeset(image, attrs) do
    image
    |> cast(attrs, [:img_url, :glaze_id])
    |> validate_required([:img_url, :glaze_id])
    |> assoc_constraint(:glazes)
  end
end
