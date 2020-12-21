defmodule DealershipWeb.LegacyRedirect do
  alias Dealership.Listings

  def init(opts), do: opts

  def call(conn, [forward_to: new_path]) do
    slug = build_slug(conn)

    conn
    |> Plug.Conn.put_status(301)
    |> Phoenix.Controller.redirect(to: "#{new_path}/#{slug}")
    |> Plug.Conn.halt()
  end

  defp build_slug(%Plug.Conn{params: params}) do
    params["id"]
    |> Listings.get_car!()
    |> url_structure()
    |> Slugger.slugify_downcase()
  end

  defp url_structure(car) do
    "#{car.car_Year} #{car.car_Make} #{car.car_Model} #{car.car_pk}"
  end

end
