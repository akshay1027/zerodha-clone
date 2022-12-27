defmodule ZerodhaKite.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :email, :string
      add :role, :string
      add :address, :string
      add :income_tax_return, :integer
      add :photograph, :string
      add :data_of_birth, :date
      add :user_id, :string

      timestamps()
    end

    create unique_index(:users, [:user_id])
    create unique_index(:users, [:email])
  end
end
