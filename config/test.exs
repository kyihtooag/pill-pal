import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :pill_pal, PillPal.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "pill_pal_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: System.schedulers_online() * 2,
  migration_primary_key: [type: :binary_id],
  migration_foreign_key: [type: :binary_id]

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :pill_pal, PillPalWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "9LEABxeOHfonbxcCfZ4wQCxfBlbeE6QZzLoB1iyDxQXQ0GkCopdtJK4f0OABNaC3",
  server: false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

# Enable helpful, but potentially expensive runtime checks
config :phoenix_live_view,
  enable_expensive_runtime_checks: true
