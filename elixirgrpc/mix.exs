defmodule Elixirgrpc.MixProject do
  use Mix.Project

  def project do
    [
      app: :elixirgrpc,
      version: "0.1.0",
      elixir: "~> 1.16",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [mod: {Elixirgrpc.GrpcApp, []},
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:grpc, "~> 0.9"},
      {:protobuf_generate, "~> 0.1.3"},

      {:cowlib, "~> 2.8", hex: :grpc_cowlib, override: true}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end
