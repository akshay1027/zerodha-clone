defmodule ZerodhaKite.Admin.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :address, :string
    field :data_of_birth, :date
    field :email, :string
    field :income_tax_return, :integer
    field :name, :string
    field :photograph, :string
    field :role, :string
    field :user_id, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email, :role, :address, :income_tax_return, :photograph, :data_of_birth, :user_id])
    |> validate_required([:name, :email, :role, :address, :income_tax_return, :photograph, :data_of_birth, :user_id])
    |> unique_constraint(:user_id)
    |> unique_constraint(:email)
  end
end
