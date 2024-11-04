defmodule Elixirgrpc.GrpcApp do
    use Application

    def start(_type, _args) do
          children = [
        {GRPC.Server.Supervisor, endpoint: Elixirgrpc.Endpoint, port: 3000, start_server: true}
      ]

      opts = [strategy: :one_for_one, name: Elixirgrpc]
      Supervisor.start_link(children, opts)

    end
  end
