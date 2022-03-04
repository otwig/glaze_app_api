defmodule GlazeApi.ModelCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      alias GlazeApi.Repo
      alias GlazeApi.Factory

      import Ecto
      import Ecto.Changeset
      import Ecto.Query
      import GlazeApi.ModelCase
    end
  end

  setup tags do
    pid = Ecto.Adapters.SQL.Sandbox.start_owner!(GlazeApi.Repo, shared: not tags[:async])
    on_exit(fn -> Ecto.Adapters.SQL.Sandbox.stop_owner(pid) end)
    {:ok, conn: Phoenix.ConnTest.build_conn()}
  end

  def errors_on(changeset) do
    Ecto.Changeset.traverse_errors(changeset, fn {message, opts} ->
      Regex.replace(~r"%{(\w+)}", message, fn _, key ->
        opts |> Keyword.get(String.to_existing_atom(key), key) |> to_string()
      end)
    end)
  end

end
