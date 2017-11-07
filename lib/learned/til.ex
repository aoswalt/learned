defmodule Learned.Til do
  import Ecto.Query
  alias Learned.Repo
  alias Learned.Til.{Post, User}
  alias Learned.Til.Post.Query, as: PostQuery
  alias Learned.Til.User.Query ,as: UserQuery

  # -- Post --

  def get_post(id) do
    Repo.get(Post, id)
  end

  def get_post_with_user(id) do
    Post
    |> where([p], p.id == ^id)
    |> PostQuery.preload_user
    |> Repo.one
  end

  def list_posts(queryable \\ Post) do
    queryable
    |> Repo.all
  end

  def list_posts_ordered(queryable \\ Post) do
    queryable
    |> PostQuery.order_by_post_date_desc
    |> list_posts
  end

  def list_posts_with_user(queryable \\ Post) do
    queryable
    |> PostQuery.preload_user
    |> list_posts
  end

  def list_posts_with_user_ordered(queryable \\ Post) do
    queryable
    |> PostQuery.preload_user
    |> PostQuery.order_by_post_date_desc
    |> list_posts
  end

  def prepare_post(post, params \\ %{}) do
    post
    |> Post.changeset(params)
  end

  def create_post(params) do
    %Post{}
    |> prepare_post(params)
    |> Repo.insert
  end

  def update_post(post, params) do
    post
    |> prepare_post(params)
    |> Repo.update
  end

  def delete_post!(id) do
    id
    |> get_post
    |> Repo.delete!
  end

  # -- User --

  def list_users(queryable \\ User) do
    queryable
    |> Repo.all
  end
end
