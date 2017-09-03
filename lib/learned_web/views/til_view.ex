defmodule LearnedWeb.TilView do
  use LearnedWeb, :view
  alias Learned.Til
  alias Learned.User

  def text(%Til{text: text}), do: text
  def user_id(%Til{user_id: user_id}), do: user_id
  def user_name(%Til{user: %User{name: name}}), do: name
end
