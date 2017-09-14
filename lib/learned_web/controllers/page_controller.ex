defmodule LearnedWeb.PageController do
  use LearnedWeb, :controller
  import Ecto.Query, only: [from: 2]
  alias Learned.Repo
  alias Learned.Til

  def index(conn, _params) do
    tils = Repo.all(from t in Til, preload: [:user])

    render conn, :index, tils: tils
  end
end
