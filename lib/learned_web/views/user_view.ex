defmodule LearnedWeb.UserView do
  use LearnedWeb, :view
  alias Learned.User

  def name(%User{name: name}), do: name
end
