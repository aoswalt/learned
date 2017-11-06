defmodule LearnedWeb.TilView do
  use LearnedWeb, :view
  import LearnedWeb.Router.Helpers
  alias Learned.Til
  alias Learned.User
  alias LearnedWeb.Endpoint

  def text(%Til{text: text}), do: text

  def user_id(%Til{user_id: user_id}), do: user_id

  # TODO(adam): find a better way to handle non loaded user
  def user_name(%Til{user: %User{name: name}}), do: name
  def user_name(_), do: ""

  def render("index.json", %{tils: tils}) do
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
      "self" => til_api_url(Endpoint, :show, til.id)
    }
  end

  def render("error.json", %{changeset: changeset}) do
    errors = changeset.errors
    |> Enum.map(&error_keywords_to_map/1)

    render("error.json", %{errors: errors})
  end

  def render("error.json", %{errors: errors}) do
    %{
      errors: errors
    }
  end

  defp error_keywords_to_map({field, {reason, _}}) do
    %{
      title: field,
      detail: reason
    }
  end
end
