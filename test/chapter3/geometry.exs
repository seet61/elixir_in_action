defmodule Chapter3.GeometryTest do
  use ExUnit.Case
  @rectangle {:rectangle, 4, 5}
  @square {:square, 5}
  @circle {:circle, 4}
  @triangle {:triangle, 1, 2, 3}

  test "Chapter3.Geometry area of rectangle" do
    assert Chapter3.Geometry.area(@rectangle) == 20
  end

  test "Chapter3.Geometry area of square" do
    assert Chapter3.Geometry.area(@square) == 25
  end

  test "Chapter3.Geometry area of circle" do
    assert Chapter3.Geometry.area(@circle) == 50.26544
  end

  test "Chapter3.Geometry error for area of triangle" do
    {:error, {:unknown_shape, _}} = Chapter3.Geometry.area(@triangle)
  end
end
