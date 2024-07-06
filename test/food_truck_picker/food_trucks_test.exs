defmodule FoodTruckPicker.FoodTrucksTest do
  use FoodTruckPicker.DataCase

  alias FoodTruckPicker.FoodTrucks

  describe "food_trucks" do
    alias FoodTruckPicker.FoodTrucks.FoodTruck

    import FoodTruckPicker.FoodTrucksFixtures

    @invalid_attrs %{name: nil, address: nil, items: nil, location_description: nil, latitude: nil, longitude: nil}

    test "get_random_food_truck/0 returns a random food_truck" do
      food_truck_1 = food_truck_fixture()
      food_truck_2 = food_truck_fixture()
      food_truck_3 = food_truck_fixture()
      random_food_truck = FoodTrucks.get_random_food_truck()
      assert Enum.member?([food_truck_1.id, food_truck_2.id, food_truck_3.id], random_food_truck.id)
    end

    test "create_food_truck/1 with valid data creates a food_truck" do
      valid_attrs = %{name: "some name", address: "some address", items: ["option1", "option2"], location_description: "some location_description", latitude: 120.5, longitude: 120.5}

      assert {:ok, %FoodTruck{} = food_truck} = FoodTrucks.create_food_truck(valid_attrs)
      assert food_truck.name == "some name"
      assert food_truck.address == "some address"
      assert food_truck.items == ["option1", "option2"]
      assert food_truck.location_description == "some location_description"
      assert food_truck.latitude == 120.5
      assert food_truck.longitude == 120.5
    end

    test "create_food_truck/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = FoodTrucks.create_food_truck(@invalid_attrs)
    end
  end
end
