defmodule Learned.Post do
  use Ecto.Schema
  import Ecto.Changeset
  alias Learned.User
  alias __MODULE__


  schema "posts" do
    field :text, :string
    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(%Post{} = post, attrs) do
    post
    |> cast(attrs, [:text, :user_id])
    |> validate_required([:text, :user_id])
  end
end
