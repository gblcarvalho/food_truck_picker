defmodule FoodTruckPicker.FoodTrucks.FoodTruck do
  use Ecto.Schema
  import Ecto.Changeset

  schema "food_trucks" do
    field :name, :string
    field :address, :string
    field :items, {:array, :string}
    field :location_description, :string
    field :latitude, :float
    field :longitude, :float

    timestamps()
  end

  @doc false
  def changeset(food_truck, attrs) do
    food_truck
    |> cast(attrs, [:name, :address, :location_description, :items, :latitude, :longitude])
    |> validate_required([:name, :address, :location_description, :items, :latitude, :longitude])
  end
end
