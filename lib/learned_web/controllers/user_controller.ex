defmodule LearnedWeb.UserController do
  use LearnedWeb, :controller
  alias Learned.Repo
  alias Learned.User

  def show(conn, %{"user_id" => user_id}) do
    user = Repo.get(User, user_id)
    render conn, "show.html", user: user
  end
end
