defmodule GlazeApi.Repo.Migrations.CreateIngredients do
  use Ecto.Migration

  def change do
    create table(:ingredients) do
      add :name, :string
      add :amount, :decimal
      add :glaze_id, references(:glazes, on_delete: :delete_all)

      timestamps()
    end

    create index(:ingredients, [:glaze_id])
  end
end
