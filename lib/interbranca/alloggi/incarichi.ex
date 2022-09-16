defmodule Interbranca.Alloggi.Incarichi do
  use Ecto.Schema
  import Ecto.Changeset

  schema "incarichi" do
    field :incarichi, :string
    field :name, :string
    field :sezione, :string
    field :tessera, :string

    timestamps()
  end

  @doc false
  def changeset(incarichi, attrs) do
    incarichi
    |> cast(attrs, [:tessera, :name, :sezione, :incarichi])
    |> validate_required([:tessera, :name, :sezione, :incarichi])
  end
end
