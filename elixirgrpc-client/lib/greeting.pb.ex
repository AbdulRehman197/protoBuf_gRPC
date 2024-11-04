defmodule Greeting.HelloRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.13.0"

  field :name, 1, type: :string
end

defmodule Greeting.HelloReply do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.13.0"

  field :message, 1, type: :string
end

defmodule Greeting.Greeter.Service do
  @moduledoc false

  use GRPC.Service, name: "greeting.Greeter", protoc_gen_elixir_version: "0.13.0"

  rpc :SayHello, Greeting.HelloRequest, Greeting.HelloReply
end

defmodule Greeting.Greeter.Stub do
  @moduledoc false

  use GRPC.Stub, service: Greeting.Greeter.Service
end