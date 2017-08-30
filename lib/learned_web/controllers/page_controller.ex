defmodule LearnedWeb.PageController do
  use LearnedWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
