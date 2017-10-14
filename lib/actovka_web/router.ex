defmodule ActovkaWeb.Router do
  use ActovkaWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :api_auth do
    plug :accepts, ["json"]
    plug ActovkaWeb.Plugs.AuthAccessPipeline
  end

  scope "/api/v1", ActovkaWeb do
    pipe_through :api

    resources "/users", UserController, except: [:new, :edit]
    get "/users/me", UserController, :me
  end

  scope "/api/v1/auth", ActovkaWeb do
    pipe_through :api

    resources "/sessions", SessionController, only: [:create, :delete]
  end
end
