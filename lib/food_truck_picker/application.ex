defmodule FoodTruckPicker.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      FoodTruckPickerWeb.Telemetry,
      # Start the Ecto repository
      FoodTruckPicker.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: FoodTruckPicker.PubSub},
      # Start Finch
      {Finch, name: FoodTruckPicker.Finch},
      # Start the Endpoint (http/https)
      FoodTruckPickerWeb.Endpoint
      # Start a worker by calling: FoodTruckPicker.Worker.start_link(arg)
      # {FoodTruckPicker.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: FoodTruckPicker.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    FoodTruckPickerWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
