defmodule PillPal.Repo do
  use Ecto.Repo,
    otp_app: :pill_pal,
    adapter: Ecto.Adapters.Postgres
end
