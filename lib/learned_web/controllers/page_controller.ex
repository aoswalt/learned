defmodule LearnedWeb.PageController do
  use LearnedWeb, :controller
  alias Learned.Til

  def index(conn, _params) do
    posts = Til.list_posts_with_user_ordered()
    render conn, :index, posts: posts
  end
end
