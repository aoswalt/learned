defmodule LearnedWeb.UserView do
  use LearnedWeb, :view
  alias Learned.Post
  alias Learned.User

  def name(%User{name: name}), do: name
  def post_text(%Post{text: text}), do: text
end
