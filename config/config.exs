# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :learned,
  ecto_repos: [Learned.Repo]

# Configures the endpoint
config :learned, LearnedWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "P3tv7R3l6b1zGi+fKK9UcSWsPd5UYq7BiG6Sy2CcShPdM+rT01ySbQCMQ3dei75G",
  render_errors: [view: LearnedWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Learned.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
