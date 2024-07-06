# FoodTruckPicker
FoodTruckPicker is a web application built using Elixir, Phoenix, and LiveView. It generates a web page accessible at [`http://0.0.0.0:4000`](http://0.0.0.0:4000) where users can receive food truck recommendations with a simple click of a button.

## Getting Started
To get the project up and running, follow these steps:

1. **Clone the repository:**
```bash
git clone https://github.com/gblcarvalho/food_truck_picker
cd food_truck_picker
```

2. **Start the application using Docker:**
Ensure Docker is installed on your machine. Then, run the following command:
```bash
docker-compose up
```

This command will build the necessary Docker containers and start the application.

3. **Access the application:**
Once the Docker containers are running, open your web browser and go to: [`http://0.0.0.0:4000`](http://0.0.0.0:4000)
You should see the main page of the FoodTruckPicker application.

## Usage
- Upon accessing [`http://0.0.0.0:4000`](http://0.0.0.0:4000), you will be greeted with a question: "Would you like a Food Truck Suggestion?".
- Click the button labeled "Yes, I do!" to receive a recommendation for a different food truck each time you click.

## Development
**Dependencies**
- Elixir
- Phoenix Framework
- Docker

**Running Locally**
If you prefer to run the application locally without Docker, follow these steps:

1. **Install Elixir and Phoenix:**
Make sure you have Elixir and Phoenix installed on your machine.

2. **Set up the database:**
Modify the database credentials in `config/dev.exs` if necessary. Then, run the following commands to set up and seed the database:

```bash
mix ecto.drop
mix ecto.setup
mix load.food_trucks
```
- `mix ecto.drop`: Drops the existing database (if any).
- `mix ecto.setup`: Sets up the database, creates tables, and runs migrations.
- `mix load.food_trucks`: Loads initial data or seeds the database with food truck information.

3. Start the Phoenix server:
  Once the database is set up, start the Phoenix server with:

```bash
mix phx.server
```
