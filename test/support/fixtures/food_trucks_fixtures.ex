defmodule FoodTruckPicker.FoodTrucksFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `FoodTruckPicker.FoodTrucks` context.
  """

  @doc """
  Generate a food_truck.
  """
  def food_truck_fixture(attrs \\ %{}) do
    {:ok, food_truck} =
      attrs
      |> Enum.into(%{
        address: "some address",
        items: ["option1", "option2"],
        latitude: 120.5,
        location_description: "some location_description",
        longitude: 120.5,
        name: "some name"
      })
      |> FoodTruckPicker.FoodTrucks.create_food_truck()

    food_truck
  end
end
