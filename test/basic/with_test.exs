defmodule Basic.WithTest do
  use ExUnit.Case

  import Basic.With

  test "use for to get all ok value" do
    result = for {:ok, x} <- [ok(1), error(2), ok(3)], do: x
    assert result == [1, 3]
  end

  test "use with to add ok value" do
    result = with {:ok, x} <- ok(1),
                  {:ok, y} <- ok(2),
                  do: x + y
    assert result == 3
  end

  test "use with to handle error case" do
    result = with {:ok, x} <- ok(1),
                  {:ok, y} <- error(3)
             do
                x + y
             else
                err -> err
             end
    assert result == {:error, 3}
  end

  test "return area giving right opts" do
    assert area_for_right_case() == {:ok, 150}
  end

  test "return error giving wrong opts" do
    assert area_for_wrong_case() == :error
  end
end