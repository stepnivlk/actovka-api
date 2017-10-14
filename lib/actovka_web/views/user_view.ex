defmodule ActovkaWeb.UserView do
  use ActovkaWeb, :view
  alias ActovkaWeb.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{
      id: user.id,
      firstName: user.first_name,
      lastName: user.last_name,
      username: user.username,
      email: user.credential.email,
      role: user.role
    }
  end
end
