defmodule Actovka.Accounts.Credential do
  use Ecto.Schema
  import Ecto.Changeset
  alias Actovka.Accounts.{Credential, User}


  schema "credentials" do
    field :email, :string
    field :encrypted_password, :string
    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(%Credential{} = credential, attrs) do
    credential
    |> cast(attrs, [:email, :encrypted_password])
    |> validate_required([:email])
    |> unique_constraint(:email)
  end
end
