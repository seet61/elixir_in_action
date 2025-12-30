defmodule TodoRelease.MixProject do
  use Mix.Project

  def project do
    [
      app: :todo_release,
      version: "0.1.1",
      elixir: "~> 1.17",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      preferred_cli_env: [release: :prod]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :runtime_tools],
      mod: {Chapter13.Release.Todo.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
      {:poolboy, "~> 1.5.2"},
      {:plug_cowboy, "~> 2.7.5"},
      {:distillery, "~> 2.0"}
    ]
  end
end
