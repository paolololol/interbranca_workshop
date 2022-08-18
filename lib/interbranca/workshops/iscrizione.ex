defmodule Interbranca.Workshops.Iscrizione do
  use Ecto.Schema
  import Ecto.Changeset

  schema "iscrizioni" do
    field :name, :string
    field :tessera, :string
    belongs_to :workshop, Interbranca.Workshops.Workshop

    timestamps()
  end

  @doc false
  def changeset(iscrizione, attrs) do
    iscrizione
    |> cast(attrs, [:name, :tessera])
    |> IO.inspect
    |> put_change(:workshop_id, String.to_integer(attrs["workshop_id"]))
    |> IO.inspect
    |> validate_required([:name, :tessera])
    # |> put_assoc(:workshop_id, attrs["workshop_id"])
  end
end
