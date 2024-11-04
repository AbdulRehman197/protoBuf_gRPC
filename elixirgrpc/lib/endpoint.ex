# Define your endpoint
defmodule Elixirgrpc.Endpoint do
  use GRPC.Endpoint

  intercept GRPC.Server.Interceptors.Logger
  run Elixirgrpc.Server
end