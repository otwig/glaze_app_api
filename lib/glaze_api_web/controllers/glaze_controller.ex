defmodule GlazeApiWeb.GlazeController do
  use GlazeApiWeb, :controller
  import Ecto.Query

  alias GlazeApi.Api.Glaze

  use JaResource
  plug JaResource

  def records(conn) do
    Glaze
  end

  defimpl Poison.Encoder, for: Decimal do
    def encode(decimal, options) do
      Decimal.to_string(decimal, :normal)
      |> Poison.Encoder.encode(options)
    end
  end

  # def record(conn, %{"id" => id}) do
  #   where(Glaze, id: ^id)
  # end

  # def handle_show(conn, id) do
  #   Repo.get_by(Glaze, id: id)
  # end
end
