defmodule Crosschallenge.Repo do
  use Ecto.Repo,
    otp_app: :crosschallenge,
    adapter: Ecto.Adapters.Postgres
end
