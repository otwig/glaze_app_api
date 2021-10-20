defmodule GlazeApiWeb.ImageController do
  use GlazeApiWeb, :controller

  alias GlazeApi.Repo
  alias GlazeApi.Api.Image

  def index(conn, _params) do
    render(conn, "index.json-api", data: Repo.all(Image))
  end
end
