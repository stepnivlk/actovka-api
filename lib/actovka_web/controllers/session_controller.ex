defmodule ActovkaWeb.SessionController do
  use ActovkaWeb, :controller

  alias Actovka.{Accounts, Guardian}

  def create(conn, %{"user" => %{"email" => email, "password" => password}}) do
    case Accounts.authenticate_by_email_password(email, password) do
      {:ok, user} ->
        {:ok, token, claims} = Actovka.Guardian.encode_and_sign(user)

        conn
        |> put_status(:ok)
        |> put_resp_header("Authorization", "Bearer #{token}")
        |> render "login.json", user: user, token: token
      {:error, :unauthorized} ->
        conn
        |> put_status(:unauthorized)
        |> render("error.json", message: "Could not login")
    end
  end

  def delete(conn, _) do
    conn
    |> configure_session(drop: true)
    |> redirect(to: "/")
  end
end
