# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :the_spread,
  ecto_repos: [TheSpread.Repo]

# Configures the endpoint
config :the_spread, TheSpread.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "b1rMc5YlkLh1aAlRFBwlJz1YrGW3oZz/hjNZpJo0xBqYTxHm4PT1HnruIp8t7xW5",
  render_errors: [view: TheSpread.ErrorView, accepts: ~w(html json)],
  pubsub: [name: TheSpread.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Configure Hound web driver
config :hound, driver: "phantomjs"

config :phoenix, :template_engines,
  haml: PhoenixHaml.Engine

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
