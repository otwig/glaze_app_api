defmodule GlazeApi.Repo.Migrations.CreateImages do
  use Ecto.Migration

  def change do
    create table(:images) do
      add :img_url, :string
      add :glaze_id, references(:glazes)

      timestamps()
    end

    #create index(:images, [:glaze_id])
  end
end
