defmodule Actovka.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Actovka.Accounts.{User, Credential}


  schema "users" do
    field :first_name, :string
    field :last_name, :string
    field :username, :string
    field :role, :string
    has_one :credential, Credential

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:first_name, :last_name, :username, :role])
    |> validate_required([:first_name, :last_name, :username])
    |> unique_constraint(:username)
  end
end
