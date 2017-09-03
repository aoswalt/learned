defmodule LearnedWeb.UserView do
  use LearnedWeb, :view
  alias Learned.Til
  alias Learned.User

  def name(%User{name: name}), do: name
  def til_text(%Til{text: text}), do: text
end
