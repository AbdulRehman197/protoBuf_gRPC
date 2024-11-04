defmodule Elixirgrpc.Server do
    use GRPC.Server,
      service: Greeting.Greeter.Service


    @spec say_hello(Greeting.HelloRequest.t(), GRPC.Server.Stream.t()) ::
    Greeting.HelloReply.t()
    
    def say_hello(request, _stream) do
        %Greeting.HelloReply{
        message: "Hello #{request.name}"
      }
    end
  end
