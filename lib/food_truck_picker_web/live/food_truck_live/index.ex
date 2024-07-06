defmodule FoodTruckPickerWeb.FoodTruckLive.Index do
  use FoodTruckPickerWeb, :live_view

  alias FoodTruckPicker.FoodTrucks

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :food_truck, nil)}
  end
    
  @impl true
  def handle_event("pick", _value, socket) do
    {:noreply, assign(socket, :food_truck, FoodTrucks.get_random_food_truck())}
  end
end
