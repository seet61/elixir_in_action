defmodule Chapter3.UserExtractorTest do
  use ExUnit.Case

  test "emty input structure" do
    assert {:error, "login missing"} == Chapter3.UserExtractor.extract_user_with(%{})
  end

  test "error login missing" do
    assert {:error, "login missing"} ==
             Chapter3.UserExtractor.extract_user_with(%{"test" => "test"})
  end

  test "error email missing" do
    assert {:error, "email missing"} ==
             Chapter3.UserExtractor.extract_user_with(%{"login" => "some_login"})
  end

  test "error password missing" do
    assert {:error, "password missing"} ==
             Chapter3.UserExtractor.extract_user_with(%{
               "login" => "some_login",
               "email" => "some_email"
             })
  end

  test "success structure" do
    assert {:ok, %{login: "some_login", email: "some_email", password: "some_password"}} ==
             Chapter3.UserExtractor.extract_user_with(%{
               "login" => "some_login",
               "email" => "some_email",
               "password" => "some_password"
             })
  end
end
