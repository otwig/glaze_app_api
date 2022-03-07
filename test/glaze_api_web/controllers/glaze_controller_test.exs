defmodule GlazeApiWeb.GlazeControllerTest do
  use GlazeApi.ConnCase
  use ExUnit.Case

  alias GlazeApi.{Ingredient, Image, Glaze}

  @create_attrs %{
    name: "some",
    temp: 10,
    atmosphere: "some",
    kind: "some",
    description: "some",
    firing: "some",
    misc: "some",
    color: "some",
    # ingredients: [%Ingredient{"some", 36.0, 1}, %Ingredient{"some", 24.0, 1}],
    # images: [%Image{"url", 1}]
  }

  setup %{api_conn: conn} do
    {:ok, conn: conn}
  end

  describe "index" do
    test "GET api/glazes", %{conn: conn} do
      Factory.insert_list(2, :glaze)
      conn = get(conn, Routes.glaze_path(conn, :index))
      assert [_, _] = json_response(conn, 200)["data"]
    end
  end

  describe "show one" do
    test "GET api/glazes/:id", %{conn: conn} do
      glaze = Factory.insert(:glaze)

      conn = get(conn, Routes.glaze_path(conn, :show, glaze.id))
      assert "#{glaze.id}" == json_response(conn, 200)["data"]["id"]
    end
  end

  describe "post" do
    test "POST api/glazes", %{conn: conn} do
      image = Factory.insert(:image)
      [ing1, ing2] = Factory.insert_list(2, :ingredient)

      valid_payload = %{
          data: %{
            type: "glaze",
            attributes: %{
                atmosphere: "reduction",
                color: "Greige",
                description: "Thick slices of French toast bread, brown sugar, half-and-half and vanilla, topped with powdered sugar. With two eggs served any style, and your choice of smoked bacon or smoked ham.",
                firing: "The fool doth think he is wise, but the wise man knows himself to be a fool.",
                kind: "chun",
                misc: "A Jedi gains power through understanding and a Sith gains understanding through power.",
                name: "Sherbert",
                temp: 11,
              },
              relationships: %{
                image: %{data: %{type: "image", id: "#{image.id}"}},
                ingredient: %{data: %{type: "ingredient", id: "#{ing1.id}"}},
              }
            }
          }


      conn = post(conn, Routes.glaze_path(conn, :create, valid_payload))
      resp = json_response(conn, 201)["data"]
      assert resp["relationships"]["ingredient"]["data"]["id"] == "#{ing1.id}"
      assert Repo.get(Glaze, resp["id"])
    end
  end

end
