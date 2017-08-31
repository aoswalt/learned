defmodule LearnedWeb.PageView do
  use LearnedWeb, :view
  alias Learned.Til

  def text(%Til{text: text}), do: text
  def user_id(%Til{user_id: user_id}), do: user_id
end
