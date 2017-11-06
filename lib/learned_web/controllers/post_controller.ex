defmodule LearnedWeb.PostController do
  use LearnedWeb, :controller
  import Ecto.Query, only: [from: 2]
  alias Learned.Repo
  alias Learned.Post

  def index(conn, _params) do
    posts = (from t in Post,
      preload: [:user],
      order_by: [desc: t.inserted_at])
    |> Repo.all
    render conn, :index, posts: posts
  end

  def edit(conn, %{"id" => id}) do
    changeset = Post
    |> Repo.get(id)
    |> Post.changeset(%{})
    render conn, :edit, id: id, changeset: changeset
  end

  def new(conn, _params) do
    changeset = Post.changeset(%Post{}, %{})
    render conn, :new, changeset: changeset
  end

  def show(conn, %{"id" => id}) do
    post = (from t in Post,
      where: t.id == ^id,
      preload: [:user])
    |> Repo.one
    render conn, :show, post: post
  end

  def create(conn, %{"post" => %{"text" => text}}) do
    # TODO(adam): get actual user_id
    %Post{}
    |> Post.changeset(%{text: text, user_id: 1})
    |> Repo.insert
    |> case do
      # add post id to route
      {:ok, new_post} -> render conn, :show, post: new_post
      {:error, changeset} -> render conn, :error, changeset: changeset
    end
  end

  def create(conn, %{"text" => text, "userId" => user_id}) do
    params = %{
      text: text,
      user_id: user_id
    }

    %Post{}
    |> Post.changeset(params)
    |> Repo.insert
    |> case do
      {:ok, new_post} -> render conn, :show, post: new_post
      {:error, changeset} -> render conn, :error, changeset: changeset
    end
  end

  def update(conn, %{"id" => id, "post" => %{"text" => text}}) do
    Repo.get(Post, id)
    |> Post.changeset(%{text: text})
    |> Repo.update
    |> case do
      {:ok, post} -> render conn, :show, post: post
      {:error, changeset} -> render conn, :error, changeset: changeset
    end
  end

  def delete(conn, %{"id" => id}) do
    Repo.get(Post, id)
    |> Repo.delete!

    redirect(conn, to: post_path(conn, :index))
  end
end
