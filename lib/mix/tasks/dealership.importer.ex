defmodule Mix.Tasks.Dealership.Importer do
  use Mix.Task
  alias Dealership.{Repo, Listings}
  alias Dealership.InventorySync.{Downloader, Importer}
  import Mix.Ecto


  @shortdoc "Syncs inventory"
  @url 'https://elixircastsio.github.io/inventory/incoming/new_cars.csv'
  @filename "new_inventory.csv"

  def run(_args) do
    {:ok, _} = Application.ensure_all_started(:dealership)


    @url
    |> Downloader.download!(@filename)
    |> Importer.sync_inventory!()
  end

end
