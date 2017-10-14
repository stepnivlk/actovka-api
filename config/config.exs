# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :actovka,
  ecto_repos: [Actovka.Repo]

# Configures the endpoint
config :actovka, ActovkaWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "5F9Ht5urk3u3Tgi3fpNp2l7TU5mZT819lKQC6scQue62qj/U9GE36A+twb7ARerg",
  render_errors: [view: ActovkaWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Actovka.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :actovka, Actovka.Guardian,
       issuer: "actovka",
       secret_key: "jXU9m4YdM765aFqccYsovL9lML+qvZjs/BJQLfDCB0rLsuYlKDt8kdqCSoYkW+ec"

config :actovka, ActovkaWeb.Plugs.AuthAccessPipeline,
        module: Actovka.Guardian,
        error_handler: ActovkaWeb.Plugs.AuthErrorHandler

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
