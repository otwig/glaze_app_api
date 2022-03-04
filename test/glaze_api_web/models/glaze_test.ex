defmodule GlazeApi.GlazeTest do
  use ExUnit.Case
  use GlazeApiWeb.ConnCase
  alias GlazeApi.Factory
  
  alias GlazeApi.Api.Glaze

   @valid_attrs (%{name: "Lu's Purple", temp: 11, atmosphere: "reduction", ingredients: [%{amount: 12.5, name: "Silica", glaze_id: 1}, %{amount: 25.0, name: "Alumina", glaze_id: 1}]})

  test "that a glaze is created" do
    glaze = Factory.insert(:glaze) 

    changeset = %Glaze{}
                |> change(@valid_attrs)
                |> Glaze.validate

    assert changeset.valid?
    
  end
end