defmodule GlazeApiWeb.IngredientController do
    use GlazeApiWeb, :controller

    alias GlazeApi.Repo
    alias GlazeApi.Api.Ingredient

    def index(conn, _params) do
        render conn, "index.json-api", data: Repo.all(Ingredient)
    end
end
