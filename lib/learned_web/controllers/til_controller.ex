defmodule LearnedWeb.TilController do
  use LearnedWeb, :controller
  import Ecto.Query, only: [from: 2]
  alias Learned.Repo
  alias Learned.Til

  def list(conn, _params) do
    tils = Repo.all(from t in Til, preload: [:user])
    render conn, "list.html", tils: tils
  end

  def show(conn, %{"id" => id}) do
    til = (from t in Til,
      where: t.id == ^id,
      preload: [:user])
    |> Repo.one
    render conn, "show.html", til: til
  end
end
