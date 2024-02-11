defmodule ShiftEaseProto.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      ShiftEaseProtoWeb.Telemetry,
      # Start the Ecto repository
      ShiftEaseProto.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: ShiftEaseProto.PubSub},
      # Start Finch
      {Finch, name: ShiftEaseProto.Finch},
      # Start the Endpoint (http/https)
      ShiftEaseProtoWeb.Endpoint
      # Start a worker by calling: ShiftEaseProto.Worker.start_link(arg)
      # {ShiftEaseProto.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ShiftEaseProto.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ShiftEaseProtoWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
