defmodule GlazeApi do
  @moduledoc """
  GlazeApi keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  defimpl Poison.Encoder, for: Decimal do
    def encode(decimal, options) do
      decimal
      |> Decimal.to_string(:xsd)
      |> Poison.Encoder.encode(options)
    end
  end
end
