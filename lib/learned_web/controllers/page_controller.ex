defmodule LearnedWeb.PageController do
  use LearnedWeb, :controller
  alias Learned.Repo
  alias Learned.Til
  import Ecto.Query, only: [from: 2]

  def index(conn, _params) do
    tils = Repo.all(from t in Til, preload: [:user])
    render conn, "index.html", tils: tils
  end
end
