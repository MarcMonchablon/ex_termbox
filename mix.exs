defmodule ExTermbox.Mixfile do
  use Mix.Project

  def project do
    [
      app: :ex_termbox,
      version: "0.3.3",
      elixir: "~> 1.5",
      start_permanent: Mix.env() == :prod,
      compilers: [:elixir_make | Mix.compilers()],
      make_clean: ["clean"],
      deps: deps(),
      description: description(),
      package: package(),

      # Docs
      name: "ExTermbox",
      source_url: "https://github.com/ndreynolds/ex_termbox",
      docs: [
        extras: ["README.md"]
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [extra_applications: [:logger]]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:elixir_make, "~> 0.4", runtime: false},
      {:ex_doc, "~> 0.19", only: :dev, runtime: false},
      {:dialyze, "~> 0.2.0", only: :dev},
      {:credo, "~> 1.0.1-rc1", only: [:dev, :test], runtime: false}
    ]
  end

  defp description do
    "Termbox bindings for Elixir"
  end

  defp package do
    [
      files: ~w(
        c_src/termbox_bindings.c
        c_src/termbox/src
        c_src/termbox/waf
        c_src/termbox/wscript
        lib
        priv/.keep
        Makefile
        mix.exs
        README.md
        LICENSE
      ),
      maintainers: ["Nick Reynolds"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/ndreynolds/ex_termbox"}
    ]
  end
end
