defmodule Interbranca.Repo.Migrations.AddWorkshopHub do
  use Ecto.Migration

  def change do
    alter table(:workshops) do
      add :hub, :string
    end
  end
end
