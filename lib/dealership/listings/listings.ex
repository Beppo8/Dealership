defmodule Dealership.Listings do
  @moduledoc """
  The Listings context.
  """

  import Ecto.Query, warn: false
  alias Dealership.Repo

  alias Dealership.Listings.Car

  def create_or_update_car!(params) do
    :timer.sleep(2_000)

    params
    |> get_car_struct()
    |> Car.changeset(params)
    |> Repo.insert_or_update!()
  end

  defp get_car_struct(params) do
    car_vin = params["car_VIN"]

    case Repo.get_by(Car, car_VIN: car_vin) do
      nil ->
        %Car{car_VIN: car_vin}
      car ->
        car
    end
  end

  @doc """
  Returns the list of cars.

  ## Examples

      iex> list_cars()
      [%Car{}, ...]

  """
  def list_cars(params) do
    Car
    |> Car.for_sale()
    |> Repo.paginate(params)
  end

  @doc """
  Gets a single car.

  Raises if the Car does not exist.

  ## Examples

      iex> get_car!(123)
      %Car{}

  """
  def get_car!(id), do: Repo.get!(Car, id)

end
