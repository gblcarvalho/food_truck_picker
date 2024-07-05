defmodule FoodTruckPickerWeb.FoodTruckLive.FormComponent do
  use FoodTruckPickerWeb, :live_component

  alias FoodTruckPicker.FoodTrucks

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage food_truck records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="food_truck-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:name]} type="text" label="Name" />
        <.input field={@form[:address]} type="text" label="Address" />
        <.input field={@form[:location_description]} type="text" label="Location description" />
        <.input
          field={@form[:items]}
          type="select"
          multiple
          label="Items"
          options={[{"Option 1", "option1"}, {"Option 2", "option2"}]}
        />
        <.input field={@form[:latitude]} type="number" label="Latitude" step="any" />
        <.input field={@form[:longitude]} type="number" label="Longitude" step="any" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Food truck</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{food_truck: food_truck} = assigns, socket) do
    {:ok,
     socket
     |> assign(assigns)
     |> assign_new(:form, fn ->
       to_form(FoodTrucks.change_food_truck(food_truck))
     end)}
  end

  @impl true
  def handle_event("validate", %{"food_truck" => food_truck_params}, socket) do
    changeset = FoodTrucks.change_food_truck(socket.assigns.food_truck, food_truck_params)
    {:noreply, assign(socket, form: to_form(changeset, action: :validate))}
  end

  def handle_event("save", %{"food_truck" => food_truck_params}, socket) do
    save_food_truck(socket, socket.assigns.action, food_truck_params)
  end

  defp save_food_truck(socket, :edit, food_truck_params) do
    case FoodTrucks.update_food_truck(socket.assigns.food_truck, food_truck_params) do
      {:ok, food_truck} ->
        notify_parent({:saved, food_truck})

        {:noreply,
         socket
         |> put_flash(:info, "Food truck updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp save_food_truck(socket, :new, food_truck_params) do
    case FoodTrucks.create_food_truck(food_truck_params) do
      {:ok, food_truck} ->
        notify_parent({:saved, food_truck})

        {:noreply,
         socket
         |> put_flash(:info, "Food truck created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
