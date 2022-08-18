defmodule Interbranca.Repo.Migrations.CreateIscrizioni do
  use Ecto.Migration

  def change do
    create table(:iscrizioni) do
      add :name, :string
      add :tessera, :string
      add :workshop_id, references(:workshops, on_delete: :nothing)

      timestamps()
    end

    create index(:iscrizioni, [:workshop_id])
  end
end
