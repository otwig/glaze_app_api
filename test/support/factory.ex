defmodule GlazeApi.Factory do
  use ExMachina.Ecto, repo: GlazeApi.Repo

  def glaze_factory do
    %GlazeApi.Glaze{
      name: Faker.Cannabis.strain(),
      temp: 11,
      atmosphere: "reduction",
      kind: "reduction",
      description: Faker.Food.En.description(),
      firing: Faker.Lorem.Shakespeare.En.as_you_like_it(),
      misc: Faker.StarWars.quote(),
      color: Faker.Color.fancy_name(),
      images: [build(:image)],
      ingredients: [build(:ingredient), build(:ingredient)],
    }
  end

  def ingredient_factory do
    num = Enum.to_list(1..50)

    %GlazeApi.Ingredient{
      amount: Enum.random(num),
      name: Faker.StarWars.planet(),
    }
  end

  def image_factory do
   %GlazeApi.Image{
      img_url: "http://placeholderurl.com",
    }
  end
end