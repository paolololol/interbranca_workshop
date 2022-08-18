# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :interbranca,
  ecto_repos: [Interbranca.Repo]

# Configures the endpoint
config :interbranca, InterbrancaWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: InterbrancaWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Interbranca.PubSub,
  live_view: [signing_salt: "MkxYiamK"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :interbranca, Interbranca.Mailer, adapter: Swoosh.Adapters.Local

# Swoosh API client is needed for adapters other than SMTP.
config :swoosh, :api_client, false

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.14.29",
  default: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :ueberauth, Ueberauth.Strategy.Keycloak.OAuth,
    client_id: "interbranca",
    client_secret: "5f6c4e67-53c9-4364-8683-280689df6794",
    site: "https://auth.cngei.it",
    authorize_url: "https://auth.cngei.it/auth/realms/cngei/protocol/openid-connect/auth",
    token_url: "https://auth.cngei.it/auth/realms/cngei/protocol/openid-connect/token",
    userinfo_url: "https://auth.cngei.it/auth/realms/cngei/protocol/openid-connect/userinfo"

config :ueberauth, Ueberauth,
       providers: [
         keycloak: {Ueberauth.Strategy.Keycloak, [
           default_scope: "profile",
           request_path: "/auth",
           callback_path: "/auth/callback"
         ]}
       ]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.

import_config "#{config_env()}.exs"
