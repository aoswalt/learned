defmodule LearnedWeb.PageController do
  use LearnedWeb, :controller
  alias Learned.Repo
  alias Learned.Til

  def index(conn, _params) do
    tils = Repo.all(Til)
    render conn, "index.html", tils: tils
  end
end
