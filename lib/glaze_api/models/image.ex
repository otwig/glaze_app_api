defmodule GlazeApi.Image do
  use Ecto.Schema
  use GlazeApiWeb, :model

  alias GlazeApi.Glaze

  schema "images" do
    field :img_url, :string

    belongs_to :glaze, Glaze

    timestamps()
  end

  @doc false
  def changeset(image, attrs) do
    image
    |> cast(attrs, [:img_url, :glaze_id])
    |> validate_required([:img_url, :glaze_id])
    |> foreign_key_constraint(:glaze_id)
  end
end