defmodule Chapter3.UserExtractor2 do
  def extract_user_with(user) do
    case Enum.filter(
           ["login", "email", "password"],
           &(not Map.has_key?(user, &1))
         ) do
      [] ->
        {:ok,
         %{
           login: extract_login(user),
           email: extract_email(user),
           password: extract_password(user)
         }}

      list ->
        {:error, "missing: #{Enum.join(list, ",")}"}
    end
  end

  defp extract_login(%{"login" => login}) do
    login
  end

  defp extract_email(%{"email" => email}), do: email

  defp extract_password(%{"password" => password}), do: password
end
