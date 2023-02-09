defmodule Concord.Repo do
  use Ecto.Repo,
    otp_app: :concord,
    adapter: Ecto.Adapters.Postgres
end
