defmodule GlazeApiWeb.GlazeController do
  use GlazeApiWeb, :controller

  alias GlazeApi.Repo
  alias GlazeApi.Api.Glaze

  def index(conn, _params) do
    render(conn, "index.json-api", data: Repo.all(Glaze))
  end

  def show(conn, %{"id" => id}) do
    glaze = Repo.get(Glaze, id)
    # |> Repo.preload([:ingredients])
    render(conn, "show.json-api", data: glaze)
  end

  # , opts: [include: 'ingredients']
  def create(conn, %{"data" => data}) do
    attrs = JaSerializer.Params.to_attributes(data)
    changeset = Glaze.changeset(%Glaze{}, attrs)

    case Repo.insert(changeset) do
      {:ok, glaze} ->
        conn
        |> put_status(201)
        |> render("show.json-api", data: glaze)

      {:error, changeset} ->
        conn
        |> put_status(422)
        |> render(:errors, data: changeset)
    end
  end
end
