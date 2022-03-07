defmodule GlazeApi.GlazeTest do
  use GlazeApi.DataCase
  use GlazeApiWeb, :test

   @valid_attrs (%{
     name: "Lu's Purple", 
     temp: 11, 
     atmosphere: "reduction", 
     ingredients: [
       %{amount: 12.5, name: "Silica", glaze_id: 1}, 
       %{amount: 25.0, name: "Alumina", glaze_id: 1}
      ]
    })

    @invalid_attrs (%{
      name: nil, temp: 25, atmosphere: "reduction"
    })

  test "changeset with valid attributes" do
    changeset = Glaze.changeset(%Glaze{}, @valid_attrs)

    assert changeset.valid?
    assert get_field(changeset, :name) == "Lu's Purple"
    
  end

  test "changeset with invalid attributes" do
    changeset = Glaze.changeset(%Glaze{}, @invalid_attrs)

    refute changeset.valid?
  end
end