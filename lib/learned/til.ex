defmodule Learned.Til do
  use Ecto.Schema
  import Ecto.Changeset
  alias Learned.User
  alias Learned.Til


  schema "tils" do
    field :text, :string
    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(%Til{} = til, attrs) do
    til
    |> cast(attrs, [:text, :user_id])
    |> validate_required([:text, :user_id])
  end
end
