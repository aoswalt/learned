defmodule LearnedWeb.PostView do
  use LearnedWeb, :view
  import LearnedWeb.Router.Helpers
  alias Learned.Post
  alias Learned.User
  alias LearnedWeb.Endpoint

  def text(%Post{text: text}), do: text

  def user_id(%Post{user_id: user_id}), do: user_id

  # TODO(adam): find a better way to handle non loaded user
  def user_name(%Post{user: %User{name: name}}), do: name
  def user_name(_), do: ""

  def render("index.json", %{posts: posts}) do
    %{data: render_many(posts, __MODULE__, "post.json")}
  end

  def render("show.json", %{post: post}) do
    %{data: [render_one(post, __MODULE__, "post.json")]}
  end

  def render("post.json", %{post: post}) do
    %{
      "id" => post.id,
      "text" => post.text,
      "userId" => post.user_id,
      "self" => api_post_url(Endpoint, :show, post.id)
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
