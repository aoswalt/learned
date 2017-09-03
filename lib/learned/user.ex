defmodule Learned.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Learned.User
  alias Learned.Til


  schema "users" do
    field :name, :string
    has_many :tils, Til

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
