defmodule GlazeApiWeb.GlazeTest do
  use ExUnit.Case
  use GlazeApi.{ModelCase, ConnCase}

  alias GlazeApi.Api.Glaze

   @valid_attrs (%{name: "Lu's Purple", temp: 11, atmosphere: "reduction", ingredients: [%{amount: 12.5, name: "Silica", glaze_id: 1}, %{amount: 25.0, name: "Alumina", glaze_id: 1}]})

  test "that a glaze is created" do

    changeset = Glaze.changeset(%Glaze{}, @valid_attrs)
    assert changeset.valid?
    assert get_field(changeset, :name) == "Lu's Purple"
    
  end
end