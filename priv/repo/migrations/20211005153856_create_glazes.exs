defmodule GlazeApi.Repo.Migrations.GlazesNew do
  use Ecto.Migration

  def change do
    create table(:glazes) do
      add :name, :string
      add :temp, :integer
      add :atmosphere, :string
      add :kind, :string
      add :description, :string
      add :firing, :string
      add :misc, :string

      timestamps()
    end
  end
end
