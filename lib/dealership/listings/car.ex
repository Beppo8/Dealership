defmodule Dealership.Listings.Car do
  use Ecto.Schema
  import Ecto.Query, only: [from: 2]
  import Ecto.Changeset
  alias Dealership.Listings.Car

  @allowed_attrs [:car_Stock,
                  :car_VIN,
                  :car_Year,
                  :car_Make,
                  :car_Model,
                  :car_Body,
                  :car_Trim,
                  :car_Doors,
                  :car_ExteriorColor,
                  :car_InteriorColor,
                  :car_EngineCylinders,
                  :car_EngineDisplacement,
                  :car_Transmission,
                  :car_Miles,
                  :car_SellingPrice,
                  :car_Certified,
                  :car_Description,
                  :car_Options,
                  :car_Engine_Description,
                  :car_Transmission_Speed,
                  :car_Transmission_Description,
                  :car_Drivetrain,
                  :car_Fuel_Type,
                  :car_CityMPG,
                  :car_HighwayMPG,
                  :car_PassengerCapacity,
                  :car_isFeatured,
                  :car_isReduced,
                  :car_isListed,
                  :car_Carfax_One_Owner,
                  :image_list]

  @primary_key {:car_pk, :id, autogenerate: true}
  schema "cars" do
    field :car_Stock, :string
    field :car_VIN, :string
    field :car_Year, :integer
    field :car_Make, :string
    field :car_Model, :string
    field :car_Body, :string
    field :car_Trim, :string
    field :car_Doors, :string
    field :car_ExteriorColor, :string
    field :car_InteriorColor, :string
    field :car_EngineCylinders, :string
    field :car_EngineDisplacement, :string
    field :car_Transmission, :string
    field :car_Miles, :integer
    field :car_SellingPrice, :integer
    field :car_Certified, :string
    field :car_Description, :string
    field :car_Options, :string
    field :car_Engine_Description, :string
    field :car_Transmission_Speed, :string
    field :car_Transmission_Description, :string
    field :car_Drivetrain, :string
    field :car_Fuel_Type, :string
    field :car_CityMPG, :integer
    field :car_HighwayMPG, :integer
    field :car_PassengerCapacity, :string
    field :car_isFeatured, :string
    field :car_isReduced, :string
    field :car_isListed, :string
    field :car_Carfax_One_Owner, :string
    field :image_list, :string
  end

  def changeset(%Car{} = car, attrs) do
    car
    |> cast(attrs, @allowed_attrs)
    |> validate_required([:car_Year, :car_Make, :car_Model, :car_VIN])
  end

  def for_sale(query) do
    from car in query,
    where: car.car_isListed == "Y"
  end

  def not_included(query, active_vins) do
    from car in query,
    where: not(car.car_VIN in ^active_vins)
  end

  defimpl Phoenix.Param, for: Dealership.Listings.Car do
    def to_param(%{car_pk: id, car_Year: year, car_Make: make, car_Model: model}) do
      Slugger.slugify_downcase("#{year} #{make} #{model} #{id}")
    end
  end

end
