defmodule LearnedWeb.PageController do
  use LearnedWeb, :controller
  import Ecto.Query, only: [from: 2]
  alias Learned.Repo
  alias Learned.Til.Post

  def index(conn, _params) do
    posts = Repo.all(from t in Post, preload: [:user])

    render conn, :index, posts: posts
  end
end
