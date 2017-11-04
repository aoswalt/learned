defmodule LearnedWeb.Router do
  use LearnedWeb, :router
  alias Plug.Conn

  defp conditional_plugs(%Conn{private: %{phoenix_format: "html"}} = conn, opts) do
    # TODO(adam): is there a way to use the plug macro here?
    conn
    |> fetch_session(opts)
    |> fetch_flash(opts)
    |> protect_from_forgery(opts)
    |> put_secure_browser_headers(opts)
  end

  defp conditional_plugs(conn, _opts) do
    conn
  end

  pipeline :common do
    plug :accepts, ["json", "html"]
    plug :conditional_plugs
  end

  scope "/", LearnedWeb do
    pipe_through :common # Use shared browser api pipeline

    get "/", PageController, :index

    get "/tils", TilController, :index
    get "/tils/:id/edit", TilController, :edit
    get "/tils/new", TilController, :new
    get "/tils/:id", TilController, :show
    post "/tils", TilController, :create
    patch "/tils/:id", TilController, :update
    put "/tils/:id", TilController, :update
    # delete "/tils/:id", TilController, :delete

    get "/users/:user_id", UserController, :show
  end
end
