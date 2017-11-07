defmodule Learned.Til.Post do
  use Ecto.Schema
  import Ecto.Changeset
  alias __MODULE__
  alias Learned.Til.User

  schema "posts" do
    field :text, :string
    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(%Post{} = post, attrs \\ %{}) do
    post
    |> cast(attrs, [:text, :user_id])
    |> validate_required([:text, :user_id])
  end
end
