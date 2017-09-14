defmodule LearnedWeb.Router do
  use LearnedWeb, :router

  pipeline :common do
    plug :accepts, ["json", "html"]
    # TODO(adam): make plug that skips based on accepts?
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/", LearnedWeb do
    pipe_through :common # Use shared browser api pipeline

    get "/", TilController, :index

    get "/tils", TilController, :index
    # get "/tils/:id/edit", TilController, :edit
    # get "/tils/new", TilController, :new
    get "/tils/:id", TilController, :show
    post "/tils", TilController, :create
    # patch "/tils/:id", TilController, :update
    # put "/tils/:id", TilController, :update
    # delete "/tils/:id", TilController, :delete

    get "/users/:user_id", UserController, :show
  end
end
