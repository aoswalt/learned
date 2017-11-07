defmodule LearnedWeb.UserController do
  use LearnedWeb, :controller
  alias Learned.Repo
  alias Learned.Til.User
  import Ecto.Query, only: [from: 2]

  def show(conn, %{"user_id" => user_id}) do
    user = (from u in User,
      where: u.id == ^user_id,
      preload: [:posts])
    |> Repo.one
    render conn, "show.html", user: user
  end
end
