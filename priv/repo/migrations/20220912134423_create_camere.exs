defmodule Interbranca.Repo.Migrations.CreateCamere do
  use Ecto.Migration

  def change do
    create table(:camere) do
      add :tessera, :string
      add :nome, :string
      add :tipologia, :string
      add :struttura, :string
      add :camera, :string

      timestamps()
    end
  end
end
