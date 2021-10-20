defmodule GlazeApiWeb.PageController do
  use GlazeApiWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
