defmodule Aureon.Repo do
  use Ecto.Repo,
    otp_app: :aureon,
    adapter: Ecto.Adapters.Postgres
end
