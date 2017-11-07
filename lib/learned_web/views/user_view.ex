defmodule LearnedWeb.UserView do
  use LearnedWeb, :view
  alias Learned.Til.Post
  alias Learned.Til.User

  def name(%User{name: name}), do: name
  def post_text(%Post{text: text}), do: text
end
