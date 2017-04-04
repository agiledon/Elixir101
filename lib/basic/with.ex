defmodule Basic.With do
  def ok(x), do: {:ok, x}
  def error(x), do: {:error, x}

  def area_for_right_case() do
    opts = %{width: 10, height: 15}
    area(opts)
  end

  def area_for_wrong_case() do
    opts = %{width: 10}
    area(opts)
  end

  defp area(opts) do
    with {:ok, width} <- Map.fetch(opts, :width),
         {:ok, height} <- Map.fetch(opts, :height),
    do: {:ok, width * height}
  end
end