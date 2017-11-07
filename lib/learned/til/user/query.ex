defmodule Learned.Til.User.Query do
  import Ecto.Query

  def preload_posts(queryable) do
    queryable
    |> preload([q], [:posts])
  end

  def where_has_posts(queryable) do
    queryable
  end
end
