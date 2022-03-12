defmodule MidiFreq.MixProject do
  use Mix.Project

  @elixir_requirement "~> 1.13"
  @version "0.1.0"
  @description "Utility functions for MIDI number to frequency conversions"

  def project do
    [
      app: :midi_freq,
      version: @version,
      elixir: @elixir_requirement,
      name: "MidiFreq",
      description: @description,
      package: package(),
      source_url: "https://github.com/robmckinnon/midi_freq",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      # extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:mix_test_watch, "~> 1.0", only: :dev, runtime: false}
    ]
  end

  defp package() do
    [
      files: ~w(lib priv .formatter.exs mix.exs README* readme* LICENSE*
                license* CHANGELOG* changelog* src),
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => "https://github.com/robmckinnon/midi_freq"}
    ]
  end
end
