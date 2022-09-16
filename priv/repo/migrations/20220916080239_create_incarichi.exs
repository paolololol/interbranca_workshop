defmodule Interbranca.Repo.Migrations.CreateIncarichi do
  use Ecto.Migration

  def change do
    create table(:incarichi) do
      add :tessera, :string
      add :name, :string
      add :sezione, :string
      add :incarichi, :string

      timestamps()
    end
  end
end
