defmodule LearnedWeb.PostController do
  use LearnedWeb, :controller
  alias Learned.Til
  alias Learned.Til.Post

  def index(conn, _params) do
    list = Til.list_posts_with_user_ordered()
    render conn, :index, posts: list
  end

  def edit(conn, %{"id" => id}) do
    changeset =
      id
      |> Til.get_post
      |> Til.prepare_post

    render conn, :edit, id: id, changeset: changeset
  end

  def new(conn, _params) do
    changeset = Til.prepare_post(%Post{})
    render conn, :new, changeset: changeset
  end

  def show(conn, %{"id" => id}) do
    post = Til.get_post_with_user(id)
    render conn, :show, post: post
  end

  def create(conn, %{"post" => %{"text" => text}}) do
    # TODO(adam): get actual user_id with plug
    params = %{text: text, user_id: 1}

    params
    |> Til.create_post
    |> case do
      {:ok, new_post} -> redirect(conn, to: post_path(conn, :show, new_post.id))
      {:error, changeset} -> render(conn, :error, changeset: changeset)
    end
  end

  def create(conn, %{"text" => text, "userId" => user_id}) do
    params = %{
      text: text,
      user_id: user_id
    }

    params
    |> Til.create_post
    |> case do
      {:ok, new_post} -> render conn, :show, post: new_post
      {:error, changeset} -> render conn, :error, changeset: changeset
    end
  end

  def update(conn, %{"id" => id, "post" => %{"text" => text}}) do
    id
    |> Til.get_post
    |> Til.update_post(%{text: text})
    |> case do
      {:ok, post} -> render conn, :show, post: post
      {:error, changeset} -> render conn, :error, changeset: changeset
    end
  end

  def delete(conn, %{"id" => id}) do
    Til.delete_post!(id)
    redirect(conn, to: post_path(conn, :index))
  end
end
