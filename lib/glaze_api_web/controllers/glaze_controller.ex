defmodule GlazeApiWeb.GlazeController do
  use GlazeApiWeb, :controller
  import Ecto.Query

  alias GlazeApi.Api.Glaze
  alias GlazeApi.Repo

  use JaResource
  plug JaResource

  def records(conn) do
    Glaze
  end

  # def record(conn, %{"id" => id}) do
  #   where(Glaze, id: ^id)
  # end

  ## this works in iex but i think the above is what i need
  def get_glaze(id) do
    Glaze |> Repo.get(id)
  end

  defimpl Poison.Encoder, for: Decimal do
    def encode(decimal, options) do
      Decimal.to_string(decimal, :normal)
      |> Poison.Encoder.encode(options)
    end
  end

  def create_glaze(attrs \\ %{}) do
    %Glaze{}
    |> Glaze.changeset(attrs)
    |> Repo.insert()
  end

  def update_glaze(%Glaze{} = glaze, attrs \\ %{}) do
    glaze
    |> Glaze.changeset(attrs)
    |> Repo.update()
  end




  # def handle_show(conn, id) do
  #   Repo.get_by(Glaze, id: id)
  # end
end
