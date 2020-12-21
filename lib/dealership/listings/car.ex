defmodule Dealership.Listings.Car do
  use Ecto.Schema

  @derive {Phoenix.Param, key: :car_pk}
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

end
