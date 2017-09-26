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

  def edit(conn, %{"id" => id}) do
    changeset = Til
    |> Repo.get(id)
    |> Til.changeset(%{})
    render conn, :edit, id: id, changeset: changeset
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
      {:ok, new_til} -> render conn, :show, til: new_til
      {:error, changeset} -> render conn, :error, changeset: changeset
    end
  end

  def update(conn, %{"id" => id, "til" => %{"text" => text}}) do
    Repo.get(Til, id)
    |> Til.changeset(%{text: text})
    |> Repo.update
    |> case do
      {:ok, til} -> render conn, :show, til: til
      {:error, changeset} -> render conn, :error, changeset: changeset
    end
  end
end
