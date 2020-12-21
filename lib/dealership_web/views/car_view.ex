defmodule DealershipWeb.CarView do
  use DealershipWeb, :view
  import Kerosene.HTML

  def format_price(price) do
    Number.Currency.number_to_currency(price)
  end

  def format_mileage(miles) do
    Number.Delimit.number_to_delimited(miles, precision: 0)
  end

  def car_title(car) do
    "#{car.car_Year} #{car.car_Make} #{car.car_Model}"
  end
end
