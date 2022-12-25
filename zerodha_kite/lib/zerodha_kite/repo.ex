defmodule ZerodhaKite.Repo do
  use Ecto.Repo,
    otp_app: :zerodha_kite,
    adapter: Ecto.Adapters.Postgres
end
