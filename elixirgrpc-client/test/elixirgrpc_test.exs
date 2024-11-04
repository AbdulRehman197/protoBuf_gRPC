defmodule ElixirgrpcTest do
  use ExUnit.Case
  doctest Elixirgrpc

  test "greets the world" do
    assert Elixirgrpc.hello() == :world
  end
end
