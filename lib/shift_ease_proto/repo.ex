defmodule ShiftEaseProto.Repo do
  use Ecto.Repo,
    otp_app: :shift_ease_proto,
    adapter: Ecto.Adapters.Postgres
end
