defmodule GlazeApi.Repo.Migrations.AddColorToGlazeTable do
  use Ecto.Migration

  def change do
    alter table(:glazes) do
      add :color, :string
    end
  end
end
