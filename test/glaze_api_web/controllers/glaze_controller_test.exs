defmodule GlazeApiWeb.GlazeControllerTest do
  use GlazeApiWeb.ConnCase

  alias GlazeApi.Api.Repo
  alias GlazeApi.Api.Glaze

  @create_attrs %{
    name: 'some',
    temp: 10,
    atmosphere: 'some',
    kind: 'some',
    description: 'some',
    firing: 'some',
    misc: 'some',
    ingredients: 'some',
    images: 'some'
  }

  setup %{conn: conn} do
    conn =
      conn
      |> put_req_header("accept", "application/vnd.api+json")
      |> put_req_header("content-type", "application/vnd.api+json")

    {:ok, conn: conn}
  end

  describe "index" do
    test "lists all glazes", %{conn: conn} do
      conn = get(conn, Routes.glaze_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "show" do
    test "list one glaze", %{conn: conn} do
      conn = get(conn, Routes.glaze_path(conn, :show, :id))

      assert %{
               "id" => id,
               "name" => "some",
               "temp" => 10,
               "atmosphere" => "some",
               "kind" => "some",
               "description" => "some",
               "firing" => "some",
               "misc" => "some",
               "ingredients" => "some",
               "images" => "some"
             } = json_response(conn, 200)["data"]
    end
  end
end
