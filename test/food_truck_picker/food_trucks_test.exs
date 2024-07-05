defmodule FoodTruckPicker.FoodTrucksTest do
  use FoodTruckPicker.DataCase

  alias FoodTruckPicker.FoodTrucks

  describe "food_trucks" do
    alias FoodTruckPicker.FoodTrucks.FoodTruck

    import FoodTruckPicker.FoodTrucksFixtures

    @invalid_attrs %{name: nil, address: nil, items: nil, location_description: nil, latitude: nil, longitude: nil}

    test "list_food_trucks/0 returns all food_trucks" do
      food_truck = food_truck_fixture()
      assert FoodTrucks.list_food_trucks() == [food_truck]
    end

    test "get_food_truck!/1 returns the food_truck with given id" do
      food_truck = food_truck_fixture()
      assert FoodTrucks.get_food_truck!(food_truck.id) == food_truck
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

    test "update_food_truck/2 with valid data updates the food_truck" do
      food_truck = food_truck_fixture()
      update_attrs = %{name: "some updated name", address: "some updated address", items: ["option1"], location_description: "some updated location_description", latitude: 456.7, longitude: 456.7}

      assert {:ok, %FoodTruck{} = food_truck} = FoodTrucks.update_food_truck(food_truck, update_attrs)
      assert food_truck.name == "some updated name"
      assert food_truck.address == "some updated address"
      assert food_truck.items == ["option1"]
      assert food_truck.location_description == "some updated location_description"
      assert food_truck.latitude == 456.7
      assert food_truck.longitude == 456.7
    end

    test "update_food_truck/2 with invalid data returns error changeset" do
      food_truck = food_truck_fixture()
      assert {:error, %Ecto.Changeset{}} = FoodTrucks.update_food_truck(food_truck, @invalid_attrs)
      assert food_truck == FoodTrucks.get_food_truck!(food_truck.id)
    end

    test "delete_food_truck/1 deletes the food_truck" do
      food_truck = food_truck_fixture()
      assert {:ok, %FoodTruck{}} = FoodTrucks.delete_food_truck(food_truck)
      assert_raise Ecto.NoResultsError, fn -> FoodTrucks.get_food_truck!(food_truck.id) end
    end

    test "change_food_truck/1 returns a food_truck changeset" do
      food_truck = food_truck_fixture()
      assert %Ecto.Changeset{} = FoodTrucks.change_food_truck(food_truck)
    end
  end
end
