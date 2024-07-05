defmodule FoodTruckPicker.Repo.Migrations.CreateFoodTrucks do
  use Ecto.Migration

  def change do
    create table(:food_trucks) do
      add :name, :string
      add :address, :string
      add :location_description, :string
      add :items, {:array, :string}
      add :latitude, :float
      add :longitude, :float

      timestamps()
    end
  end
end
