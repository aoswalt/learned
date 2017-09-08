defmodule LearnedWeb.TilView do
  use LearnedWeb, :view
  import LearnedWeb.Router.Helpers
  alias Learned.Til
  alias Learned.User
  alias LearnedWeb.Endpoint

  def text(%Til{text: text}), do: text
  def user_id(%Til{user_id: user_id}), do: user_id
  def user_name(%Til{user: %User{name: name}}), do: name

  def render("list.json", %{tils: tils}) do
    %{data: render_many(tils, __MODULE__, "til.json")}
  end

  def render("show.json", %{til: til}) do
    %{data: [render_one(til, __MODULE__, "til.json")]}
  end

  def render("til.json", %{til: til}) do
    %{
      "id" => til.id,
      "text" => til.text,
      "userId" => til.user_id,
      "self" => til_url(Endpoint, :show, til.id),
    }
  end
end
