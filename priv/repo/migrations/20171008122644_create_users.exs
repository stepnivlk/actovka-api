defmodule Actovka.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :first_name, :string
      add :last_name, :string
      add :username, :string
      add :role, :string, default: "user"

      timestamps()
    end

    create unique_index(:users, [:username])
  end
end
