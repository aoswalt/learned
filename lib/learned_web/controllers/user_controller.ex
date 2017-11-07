defmodule LearnedWeb.UserController do
  use LearnedWeb, :controller
  alias Learned.Til

  def show(conn, %{"user_id" => user_id}) do
    user = Til.get_user_with_posts(user_id)
    render conn, "show.html", user: user
  end
end
