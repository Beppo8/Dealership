defmodule Dealership.InventorySync.Importer do
  alias Dealership.Listings.Car
  alias Dealership.{Repo, Listings}

  def sync_inventory!(filename) do
    filename
    |> deactivate_sold_inventory!()
    |> import_inventory!()
  end

  defp import_inventory!(filename) do
    filename
    |> File.stream!()
    |> CSV.decode!(headers: true)
    |> Flow.from_enumerable(max_demand: 1, stages: 10)
    |> Flow.map(&Listings.create_or_update_car!/1)
    |> Flow.run()
    #|> Stream.map(&Listings.create_or_update_car!/1)
    #|> Enum.to_list()
  end

  defp deactivate_sold_inventory!(filename) do
    active_vins = filename
                    |> File.stream!()
                    |> CSV.decode!(headers: true)
                    |> Stream.map(fn(row) -> Map.fetch!(row, "car_VIN") end)
                    |> Enum.to_list()

    Car
    |> Car.for_sale()
    |> Car.not_included(active_vins)
    |> Repo.update_all(set: [car_isListed: "N"])

    filename
  end



end
