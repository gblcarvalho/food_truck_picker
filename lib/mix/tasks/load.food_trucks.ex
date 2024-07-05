defmodule Mix.Tasks.Load.FoodTrucks do
  alias FoodTruckPicker.FoodTrucks
  use Mix.Task

  @requirements ["app.start"]
  @impl Mix.Task
  def run(_args) do
    "./Mobile_Food_Facility_Permit.csv"
    |> Path.expand(__DIR__)
    |> File.stream!()
    |> CSV.decode(headers: true)
    |> Enum.each(fn {:ok, record} -> 
      record
      |> csv_record_to_attr()
      |> FoodTrucks.create_food_truck()
    end)

    IO.puts("Food Trucks CSV Loaded")
  end

  defp csv_record_to_attr(record) do
      { latitude, _ } = Float.parse(record["Latitude"])
      { longitude, _ } = Float.parse(record["Longitude"])
      %{
        name: record["Applicant"],
        address: record["Address"],
        location_description: record["LocationDescription"],
        items: String.split(record["FoodItems"], ":", trim: true),
        latitude: latitude,
        longitude: longitude,
      }
  end
end
