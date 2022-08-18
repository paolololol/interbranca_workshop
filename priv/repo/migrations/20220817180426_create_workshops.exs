defmodule Interbranca.Repo.Migrations.CreateWorkshops do
  use Ecto.Migration

  def change do
    create table(:workshops) do
      add :name, :string
      add :description, :text
      add :max_slots, :integer
      add :begins, :string
      add :ends, :string

      timestamps()
    end
  end
end
