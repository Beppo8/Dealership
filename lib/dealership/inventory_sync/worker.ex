defmodule Dealership.InventorySync.Worker do
  use GenServer

  alias Dealership.InventorySync.{Downloader, Importer}

  @url 'https://elixircastsio.github.io/inventory/incoming/new_cars.csv'
  @filename "new_inventory.csv"

  def start_link(_args) do
    GenServer.start_link(__MODULE__, %{})
  end

  def init(state) do
    schedule_import()
    {:ok, state}
  end

  def handle_info(:import, state) do
    @url
    |> Downloader.download!(@filename)
    |> Importer.sync_inventory!()
    schedule_import()
    {:noreply, state}
  end

  defp schedule_import do
    Process.send_after(self(), :import, 10_000)
  end

end
