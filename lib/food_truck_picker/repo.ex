defmodule FoodTruckPicker.Repo do
  use Ecto.Repo,
    otp_app: :food_truck_picker,
    adapter: Ecto.Adapters.Postgres
end
