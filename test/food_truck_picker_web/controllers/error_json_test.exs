defmodule FoodTruckPickerWeb.ErrorJSONTest do
  use FoodTruckPickerWeb.ConnCase, async: true

  test "renders 404" do
    assert FoodTruckPickerWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert FoodTruckPickerWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
