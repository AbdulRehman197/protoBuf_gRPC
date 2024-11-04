{:ok, channel} = GRPC.Stub.connect("localhost:3000", adapter: GRPC.Client.Adapters.Mint, interceptors: [GRPC.Client.Interceptors.Logger])
{:ok, reply} =
  channel
  |> Greeting.Greeter.Stub.say_hello(%Greeting.HelloRequest{
    name: "abdul"
  })


# pass tuple `timeout: :infinity` as a second arg to stay in IEx debugging

IO.inspect(reply)
