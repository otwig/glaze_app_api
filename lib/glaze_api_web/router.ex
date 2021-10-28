defmodule GlazeApiWeb.Router do
  use GlazeApiWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {GlazeApiWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json-api"]
    plug JaSerializer.ContentTypeNegotiation
    plug JaSerializer.Deserializer

    plug CORSPlug
  end

  scope "/", GlazeApiWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  scope "/api", GlazeApiWeb do
    pipe_through :api

    get "/glazes", GlazeController, :index
    get "/glazes/:id", GlazeController, :show
    post "/glazes", GlazeController, :create
    patch "/glazes/:id", GlazeController, :update
    put "/glazes/:id", GlazeController, :update
    delete "/glazes/:id", GlazeController, :delete
    # ----------------------
    get "/glazes/:glaze_id/images", ImageController, :index
    get "/glazes/:glaze_id/images/:id", ImageController, :show
    post "/glazes/:glaze_id/images", ImageController, :create
    patch "/glazes/:glaze_id/images/:id", ImageController, :update
    put "/glazes/:glaze_id/images/:id", ImageController, :update
    delete "/glazes/:glaze_id/images/:id", ImageController, :delete
    # ----------------------
    get "/glazes/:glaze_id/ingredients", IngredientController, :index
    get "/glazes/:glaze_id/ingredients/:id", IngredientController, :show
    post "/glazes/:glaze_id/ingredients", IngredientController, :create
    patch "/glazes/:glaze_id/ingredients/:id", IngredientController, :update
    put "/glazes/:glaze_id/ingredients/:id", IngredientController, :update
    delete "/glazes/:glaze_id/ingredients/:id", IngredientController, :delete
  end

  # Other scopes may use custom stacks.
  # scope "/api", GlazeApiWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: GlazeApiWeb.Telemetry
    end
  end

  # Enables the Swoosh mailbox preview in development.
  #
  # Note that preview only shows emails that were sent by the same
  # node running the Phoenix server.
  if Mix.env() == :dev do
    scope "/dev" do
      pipe_through :browser

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
