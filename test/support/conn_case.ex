defmodule GlazeApi.ConnCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      # Import conveniences for testing with connections
      import Plug.Conn
      import Phoenix.ConnTest
      import GlazeApi.ConnCase

      alias GlazeApiWeb.Router.Helpers, as: Routes

      # The default endpoint for testing
      @endpoint GlazeApiWeb.Endpoint
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(GlazeApi.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(GlazeApi.Repo, {:shared, self()})
    end

    conn = Phoenix.ConnTest.build_conn()

    api_conn =
      conn
      |> Plug.Conn.put_req_header("accept", "application/vnd.api+json")
      |> Plug.Conn.put_req_header("content-type", "application/vnd.api+json")

    # full_access_user =
    #   GlazeApi.Factory.insert(:user,
    #     email: "current_user@example.com",
    #     name: "Current User",
    #     role: "full-access"
    #   )

    # auth_conn = Guardian.Plug.api_sign_in(api_conn, full_access_user)

    # read_only_user =
    #   GlazeApi.Factory.insert(:user,
    #     email: "read_only_user@example.com",
    #     name: "Read Only User",
    #     role: "read-only"
    #   )

    # read_only_conn = Guardian.Plug.api_sign_in(api_conn, read_only_user)

    # client_user =
    #   GlazeApi.Factory.insert(:user,
    #     email: "client@user.com",
    #     name: "Client User",
    #     role: "client"
    #   )

    # client_conn = Guardian.Plug.api_sign_in(api_conn, client_user)

    # {:ok,
    #  conn: conn, api_conn: api_conn, auth_conn: auth_conn, read_only_conn: read_only_conn, client_conn: client_conn}

    {:ok, conn: conn, api_conn: api_conn}
  end
end
