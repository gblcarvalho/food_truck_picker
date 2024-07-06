defmodule FoodTruckPicker.FoodTrucks do
  @moduledoc """
  The FoodTrucks context.
  """

  import Ecto.Query, warn: false
  alias FoodTruckPicker.Repo

  alias FoodTruckPicker.FoodTrucks.FoodTruck

  @doc """
  Gets a single random food_truck.
  """
  def get_random_food_truck() do
    query =
      from FoodTruck,
      order_by: fragment("RANDOM()"),
      limit: 1
    Repo.one(query)
  end

  @doc """
  Creates a food_truck.

  ## Examples

      iex> create_food_truck(%{field: value})
      {:ok, %FoodTruck{}}

      iex> create_food_truck(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_food_truck(attrs \\ %{}) do
    %FoodTruck{}
    |> FoodTruck.changeset(attrs)
    |> Repo.insert()
  end
end
