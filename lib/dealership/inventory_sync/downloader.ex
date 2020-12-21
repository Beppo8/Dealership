defmodule Dealership.InventorySync.Downloader do

  def download!(url, filename) do
    url
    |> csv_data!()
    |> write_csv!(filename)

    filename
  end

  defp write_csv!(data, filename) do
    File.write!(filename, data)
  end

  defp csv_data!(url) do
    case fetch_csv_data(url) do
      {:ok, {{_, 200, _}, _headers, data}} ->
        data
      _ ->
        raise CsvRequestError
    end
  end

  defp fetch_csv_data(url) do
    :httpc.request(:get, {url, []}, [], body_format: :binary)
  end

  defmodule CsvRequestError do
    defexception message: "Unable to fetch inventory data"
  end

end
