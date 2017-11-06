defmodule Learned.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Learned.User
  alias Learned.Post


  schema "users" do
    field :name, :string
    has_many :posts, Post

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
