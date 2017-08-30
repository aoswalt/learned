defmodule Learned.Til do
  use Ecto.Schema
  import Ecto.Changeset
  alias Learned.Til


  schema "tils" do
    field :text, :string
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(%Til{} = til, attrs) do
    til
    |> cast(attrs, [:text])
    |> validate_required([:text])
  end
end
