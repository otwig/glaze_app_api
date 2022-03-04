defmodule GlazeApi.Factory do
  use ExMachina.Ecto, repo: GlazeApi.Repo

  def glaze_factory do
    %GlazeApi.Api.Glaze{
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

    %GlazeApi.Api.Ingredient{
      amount: Enum.random(num),
      name: Faker.StarWars.planet(),
      glaze_id: Enum.random([1, 2, 3, 4]),
    }
  end

  def image_factory do
    num = Enum.to_list(1..50)

    %GlazeApi.Api.Image{
      img_url: "http://placeholderurl.com",
      glaze_id: Enum.random([1, 2, 3, 4])
    }
  end
end