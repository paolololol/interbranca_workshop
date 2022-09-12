defmodule Interbranca.Alloggi.Camera do
  use Ecto.Schema
  import Ecto.Changeset

  schema "camere" do
    field :camera, :string
    field :nome, :string
    field :struttura, :string
    field :tessera, :string
    field :tipologia, :string

    timestamps()
  end

  @doc false
  def changeset(camera, attrs) do
    camera
    |> cast(attrs, [:tessera, :nome, :tipologia, :struttura, :camera])
    |> validate_required([:tessera, :nome, :tipologia, :struttura, :camera])
  end
end
