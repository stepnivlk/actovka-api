defmodule ActovkaWeb.Router do
  use ActovkaWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ActovkaWeb do
    pipe_through :api

    resources "/users", UserController, except: [:new, :edit]
  end
end
