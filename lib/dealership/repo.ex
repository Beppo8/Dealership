defmodule Dealership.Repo do
  use Ecto.Repo,
    otp_app: :dealership,
    adapter: Ecto.Adapters.MyXQL

  use Kerosene, per_page: 8


end
