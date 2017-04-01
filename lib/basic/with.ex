defmodule Basic.With do
  def ok(x), do: {:ok, x}
  def error(x), do: {:error, x}
end