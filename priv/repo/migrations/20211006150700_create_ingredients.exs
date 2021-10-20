defmodule GlazeApi.Repo.Migrations.CreateIngredients do
  use Ecto.Migration

  def change do
    create table(:ingredients) do
      add :name, :string
      add :amount, :decimal
      add :glaze_id, references(:glazes)

      timestamps()
    end

    #create index(:ingredients, [:id])
  end
end
