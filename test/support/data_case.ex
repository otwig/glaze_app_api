defmodule GlazeApi.DataCase do
  use ExUnit.CaseTemplate

  alias GlazeApi.Repo
  alias Ecto.Adapters.SQL

  using do
    quote do
      alias GlazeApi.Repo
      alias GlazeApi.Factory

      import Ecto
      import Ecto.Changeset
      import Ecto.Query
      import GlazeApi.DataCase

      import GlazeApi.Factory
      import GlazeApi.AssertionUtility

    end
  end

  setup tags do
    pid = Ecto.Adapters.SQL.Sandbox.start_owner!(GlazeApi.Repo, shared: not tags[:async])
    on_exit(fn -> Ecto.Adapters.SQL.Sandbox.stop_owner(pid) end)
    :ok
  end

  @doc """
  A helper that transforms changeset errors into a map of messages.

      assert {:error, changeset} = Accounts.create_user(%{password: "short"})
      assert "password is too short" in errors_on(changeset).password
      assert %{password: ["password is too short"]} = errors_on(changeset)

  """
  def errors_on(changeset) do
    Ecto.Changeset.traverse_errors(changeset, fn {message, opts} ->
      Regex.replace(~r"%{(\w+)}", message, fn _, key ->
        opts |> Keyword.get(String.to_existing_atom(key), key) |> to_string()
      end)
    end)
  end
end
