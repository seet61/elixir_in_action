defmodule Chapter3.PolymorphicTest do
  use ExUnit.Case

  test "Chapter3.PolymorphicTest number" do
    assert Chapter3.Polymorphic.double(3) == 6
  end

  test "Chapter3.PolymorphicTest string" do
    assert Chapter3.Polymorphic.double("Jar") == "JarJar"
  end
end
