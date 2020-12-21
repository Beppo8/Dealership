defmodule Dealership.ListingsTest do
  use Dealership.DataCase

  alias Dealership.Listings

  describe "cars" do
    alias Dealership.Listings.Car

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def car_fixture(attrs \\ %{}) do
      {:ok, car} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Listings.create_car()

      car
    end

    test "list_cars/0 returns all cars" do
      car = car_fixture()
      assert Listings.list_cars() == [car]
    end

    test "get_car!/1 returns the car with given id" do
      car = car_fixture()
      assert Listings.get_car!(car.id) == car
    end

    test "create_car/1 with valid data creates a car" do
      assert {:ok, %Car{} = car} = Listings.create_car(@valid_attrs)
    end

    test "create_car/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Listings.create_car(@invalid_attrs)
    end

    test "update_car/2 with valid data updates the car" do
      car = car_fixture()
      assert {:ok, %Car{} = car} = Listings.update_car(car, @update_attrs)
    end

    test "update_car/2 with invalid data returns error changeset" do
      car = car_fixture()
      assert {:error, %Ecto.Changeset{}} = Listings.update_car(car, @invalid_attrs)
      assert car == Listings.get_car!(car.id)
    end

    test "delete_car/1 deletes the car" do
      car = car_fixture()
      assert {:ok, %Car{}} = Listings.delete_car(car)
      assert_raise Ecto.NoResultsError, fn -> Listings.get_car!(car.id) end
    end

    test "change_car/1 returns a car changeset" do
      car = car_fixture()
      assert %Ecto.Changeset{} = Listings.change_car(car)
    end
  end
end
