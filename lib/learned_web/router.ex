defmodule LearnedWeb.Router do
  use LearnedWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", LearnedWeb do
    pipe_through :browser # Use the default browser stack

    get "/", TilController, :list
    get "/tils", TilController, :list
    get "/tils/:id", TilController, :show
    get "/users/:user_id", UserController, :show
  end

  # Other scopes may use custom stacks.
  scope "/api", LearnedWeb do
    pipe_through :api

    get "/", TilController, :list
    get "/tils", TilController, :list
    get "/tils/:id", TilController, :show
    get "/users/:user_id", UserController, :show
  end
end
