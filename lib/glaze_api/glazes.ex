defmodule GlazeApi.Glazes do
  import Ecto.Query, warn: false

  alias GlazeApi.Repo
  alias GlazeApi.{Glaze, Image, Ingredient}

  def list_glazes do
    Repo.all(Glaze)
    |> Repo.preload([:images, :ingredients])
  end

  def get_glaze!(id) do
    Glaze
    |> Repo.get!(id)
    |> Repo.preload([:ingredients, :images])
  end

  def one_glaze_with_all(id) do
    id
    |> glaze_with_all()
    |> Repo.one!()
  end

  def glaze_with_all(id) do
    from g in Glaze,
    where: g.id == ^id,
    preload: ^[images: images_query(id), ingredients: ingredients_query(id)]
  end


#   # --------------------------- #

  def get_glaze_with_images(id) do
    id
    |> glaze_with_images()
    |> Repo.one!()
  end

  def glaze_with_images(id) do
    from g in Glaze,
    where: g.id == ^id,
    preload: ^[images: images_query(id)]
    # join: im in Image,
    # on: im.glaze_id == g.id
  end

  def images_query(id) do
    from i in Image,
    where: i.glaze_id == ^id,
    select: i.img_url
  end


# # ----------------------------- #
  def get_glaze_with_ingredients(id) do
    id
    |> glaze_with_ingredients()
    |> Repo.one!()
  end

  def glaze_with_ingredients(id) do
    from g in Glaze,
    where: g.id == ^id,
    preload: ^[ingredients: ingredients_query(id)]
    # join: im in Image,
    # on: im.glaze_id == g.id
  end

  defp ingredients_query(id) do
    from ing in Ingredient,
    where: ing.glaze_id == ^id,
    select: [ing.name, ing.amount]
  end

# # ----------------------------- #
# # ----------------------------- #
  # def create_glaze(attrs \\ %{}) do
  #   %Glaze{}
  #   |> Glaze.changeset(attrs)
  #   |> Repo.insert()
  #   |> case do
  #     {:ok, %Glaze{} = glaze} -> {:ok, Repo.preload(glaze, :images, :ingredients)}
  #     error -> error
  #   end
  # end


  # def update_glaze(%Glaze{} = glaze, attrs) do
  #   glaze
  #   |> Glaze.changeset(attrs)
  #   |> Repo.update()
  # end

  # def delete_glaze(%Glaze{} = glaze) do
  #   Repo.delete(glaze)
  # end

  # def change_glaze(%Glaze{} = glaze, attrs \\ %{}) do
  #   Glaze.changeset(glaze, attrs)
  # end


  # def create_image(%Glaze{} = glaze, attrs \\ %{}) do
  #   glaze
  #   |> Ecto.build_assoc(:images)
  #   |> Option.changeset(attrs)
  #   |> Repo.insert()
  # end

  #   def create_ingredient(%Glaze{} = glaze, attrs \\ %{}) do
  #   glaze
  #   |> Ecto.build_assoc(:ingredients)
  #   |> Option.changeset(attrs)
  #   |> Repo.insert()
  # end


end
