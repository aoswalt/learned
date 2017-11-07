defmodule Learned.Til.Post.Query do
  import Ecto.Query

  def preload_user(queryable) do
    queryable
    |> preload([p], [:user])
  end

  def order_by_post_date_desc(queryable) do
    queryable
    |> order_by([p], desc: p.inserted_at)
  end
end

