defmodule LearnedWeb.TilController do
  use LearnedWeb, :controller
  import Ecto.Query, only: [from: 2]
  alias Learned.Repo
  alias Learned.Til

  def index(conn, _params) do
    tils = (from t in Til,
      preload: [:user],
      order_by: [desc: t.inserted_at])
    |> Repo.all
    render conn, :index, tils: tils
  end

  def show(conn, %{"id" => id}) do
    til = (from t in Til,
      where: t.id == ^id,
      preload: [:user])
    |> Repo.one
    render conn, :show, til: til
  end

  def create(conn, %{"text" => text, "userId" => user_id}) do
    params = %{
      text: text,
      user_id: user_id
    }

    %Til{}
    |> Til.changeset(params)
    |> Repo.insert
    |> case do
      {:ok, nil_til} -> render conn, :show, til: nil_til
      {:error, changeset} -> render conn, :error, changeset: changeset
    end
  end
end
