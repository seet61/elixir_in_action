defmodule Chapter3.UserExtractor do
  def extract_user(user) do
    case extract_login(user) do
      {:error, reason} ->
        {:error, reason}

      {:ok, login} ->
        case extract_email(user) do
          {:error, reason} ->
            {:error, reason}

          {:ok, email} ->
            case extract_password(user) do
              {:error, reason} -> {:error, reason}
              {:ok, password} -> %{login: login, email: email, password: password}
            end
        end
    end
  end

  def extract_user_with(user) do
    with {:ok, login} <- extract_login(user),
         {:ok, email} <- extract_email(user),
         {:ok, password} <- extract_password(user) do
      {:ok, %{login: login, email: email, password: password}}
    end
  end

  defp extract_login(%{"login" => login}) do
    {:ok, login}
  end

  defp extract_login(_) do
    {:error, "login missing"}
  end

  defp extract_email(%{"email" => email}), do: {:ok, email}
  defp extract_email(_), do: {:error, "email missing"}

  defp extract_password(%{"password" => password}), do: {:ok, password}
  defp extract_password(_), do: {:error, "password missing"}
end
