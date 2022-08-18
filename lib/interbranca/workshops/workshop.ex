defmodule Interbranca.Workshops.Workshop do
  use Ecto.Schema
  import Ecto.Changeset

  schema "workshops" do
    field :begins, :string
    field :description, :string
    field :ends, :string
    field :max_slots, :integer
    field :name, :string
    has_many :iscrizioni, Interbranca.Workshops.Iscrizione

    timestamps()
  end

  @doc false
  def changeset(workshop, attrs) do
    workshop
    |> cast(attrs, [:name, :description, :max_slots, :begins, :ends])
    |> validate_required([:name, :description, :max_slots, :begins, :ends])
  end
end
