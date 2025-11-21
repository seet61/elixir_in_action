defmodule Chapter3.UserExtractor2Test do
  use ExUnit.Case

  test "emty input structure" do
    assert {:error, "missing: login,email,password"} ==
             Chapter3.UserExtractor2.extract_user_with(%{})
  end

  test "error login missing" do
    assert {:error, "missing: login,email,password"} ==
             Chapter3.UserExtractor2.extract_user_with(%{"test" => "test"})
  end

  test "error email missing" do
    assert {:error, "missing: email,password"} ==
             Chapter3.UserExtractor2.extract_user_with(%{"login" => "some_login"})
  end

  test "error password missing" do
    assert {:error, "missing: password"} ==
             Chapter3.UserExtractor2.extract_user_with(%{
               "login" => "some_login",
               "email" => "some_email"
             })
  end

  test "success structure" do
    assert {:ok, %{login: "some_login", email: "some_email", password: "some_password"}} ==
             Chapter3.UserExtractor2.extract_user_with(%{
               "login" => "some_login",
               "email" => "some_email",
               "password" => "some_password"
             })
  end
end
