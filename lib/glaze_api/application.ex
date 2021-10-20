defmodule GlazeApi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      GlazeApi.Repo,
      # Start the Telemetry supervisor
      GlazeApiWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: GlazeApi.PubSub},
      # Start the Endpoint (http/https)
      GlazeApiWeb.Endpoint
      # Start a worker by calling: GlazeApi.Worker.start_link(arg)
      # {GlazeApi.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: GlazeApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    GlazeApiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
