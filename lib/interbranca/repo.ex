defmodule Interbranca.Repo do
  use Ecto.Repo,
    otp_app: :interbranca,
    adapter: Ecto.Adapters.Postgres
end
