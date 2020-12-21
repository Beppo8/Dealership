# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :dealership,
  ecto_repos: [Dealership.Repo]

# Configures the endpoint
config :dealership, DealershipWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "7+PWMQBEevShFf/23V4SHLdrQ292FLITxMSqBWvNsXsGAs/U49uKCuvxxjZw9mrP",
  render_errors: [view: DealershipWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Dealership.PubSub,
  live_view: [signing_salt: "j3c0koif"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
