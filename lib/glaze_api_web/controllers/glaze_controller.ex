defmodule GlazeApiWeb.GlazeController do
  import Ecto.Query
  use GlazeApiWeb, :controller
  use JaResource

  alias GlazeApi.Repo
  alias GlazeApi.Api.Glaze
  alias GlazeApi.Glazes

  plug JaResource

  # def index(conn, _params) do
  #   glazes = Glazes.list_glazes
  #   render(conn, "index.json-api", data: glazes)
  # end

  # def show(conn, %{"id" => id}) do
  # glaze = Glaze
  #         |> Repo.get(id)
  #         |> Repo.preload([:images, :ingredients])
  #         render(conn, "show.json-api", data: glaze)
  # end

    def handle_index(conn, _params) do
      Glaze
    end

end
