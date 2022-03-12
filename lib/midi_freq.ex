defmodule MidiFreq do
  @moduledoc """
  Utility functions for MIDI number to frequency conversions.
  """

  @doc """
  Return frequency for given MIDI note number, and optional base frequency.

  ## Examples
      iex> MidiFreq.freq(69)
      440.0

      iex> MidiFreq.freq(69.5)
      452.8929841231365

      iex> MidiFreq.freq(69, _base_freq = 432)
      432.0
  """
  def freq(note_number, base_freq \\ 440) when is_number(note_number) do
    base_freq * :math.pow(2, (note_number - 69.0) / 12.0)
  end
end
