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
  def freq(note_number, base_freq \\ 440) when is_number(note_number) and is_number(base_freq) do
    base_freq * :math.pow(2, (note_number - 69.0) / 12.0)
  end

  @doc """
  Return MIDI note number for given frequency, and optional base frequency.

  ## Examples
      iex> MidiFreq.midi(440)
      69

      iex> MidiFreq.midi(452.8929841231365)
      69.5

      iex> MidiFreq.midi(432.0, _base_freq = 432)
      69
  """
  def midi(frequency, base_freq \\ 440) when is_number(frequency) and is_number(base_freq) do
    note_number = :math.log2(frequency / base_freq) * 12 + 69

    if trunc(note_number) == note_number do
      trunc(note_number)
    else
      note_number
    end
  end
end
