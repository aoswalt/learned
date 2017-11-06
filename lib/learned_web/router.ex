defmodule LearnedWeb.Router do
  use LearnedWeb, :router
  alias Plug.Conn

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
    pipe_through :browser

    get "/", PageController, :index
    resources "/posts", PostController
    get "/users/:user_id", UserController, :show
  end

  scope "/api", LearnedWeb, as: :api do
    pipe_through :api

    resources "/posts", PostController, except: [:new, :edit]
  end
end
