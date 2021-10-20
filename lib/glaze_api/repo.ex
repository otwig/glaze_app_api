defmodule GlazeApi.Repo do
  use Ecto.Repo,
    otp_app: :glaze_api,
    adapter: Ecto.Adapters.Postgres
end
