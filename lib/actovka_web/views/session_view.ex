defmodule ActovkaWeb.SessionView do
  use ActovkaWeb, :view
  alias ActovkaWeb.SessionView

  def render("login.json", %{user: user, token: token}) do
    %{
      id: user.id,
      firstName: user.first_name,
      lastName: user.last_name,
      username: user.username,
      email: user.credential.email,
      role: user.role,
      token: token,
    }
  end

  def render("error.json", %{message: message}) do
    %{
      message: message
    }
  end
end
