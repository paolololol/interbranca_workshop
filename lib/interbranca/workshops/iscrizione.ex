defmodule Interbranca.Workshops.Iscrizione do
  use Ecto.Schema
  import Ecto.Changeset

  schema "iscrizioni" do
    field :name, :string
    belongs_to :persona, Interbranca.Alloggi.Incarichi, foreign_key: :tessera, type: :string, references: :tessera
    belongs_to :workshop, Interbranca.Workshops.Workshop

    timestamps()
  end

  @doc false
  def changeset(iscrizione, attrs) do
    iscrizione
    |> cast(attrs, [:name, :tessera])
    |> put_change(:workshop_id, String.to_integer(attrs["workshop_id"]))
    |> validate_required([:name, :tessera])
  end
end
