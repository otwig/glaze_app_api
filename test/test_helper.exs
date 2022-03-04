ExUnit.start()
Faker.start()

{:ok, _} = Application.ensure_all_started(:ex_machina)
{:ok, _} = Application.ensure_all_started(:faker)

Ecto.Adapters.SQL.Sandbox.mode(GlazeApi.Repo, :manual)
