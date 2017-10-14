defmodule Actovka.Accounts.Credential do
  use Ecto.Schema
  import Ecto.Changeset
  alias Actovka.Accounts.{Credential, User}

  @bcrypt Comeonin.Bcrypt

  schema "credentials" do
    field :email, :string
    field :encrypted_password, :string
    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true
    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(%Credential{} = credential, attrs) do
    credential
    |> cast(attrs, [:email, :password, :password_confirmation])
    |> validate_required([:email])
    |> unique_constraint(:email)
    |> validate_length(:password, min: 6)
    |> validate_password_confirmation_presence
    |> encrypt_password
  end

  defp downcase_email(changeset) do
    case get_change(changeset, :email) do
      nil ->
        changeset
      email ->
        put_change(changeset, :email, String.downcase(email))
    end
  end

  defp encrypt_password(changeset) do
    case get_change(changeset, :password) do
      nil ->
        changeset
      plain_text_password ->
        encrypted_password = @bcrypt.hashpwsalt(plain_text_password)

        put_change(changeset, :encrypted_password, encrypted_password)
    end
  end

  defp validate_password_confirmation_presence(changeset) do
    password = get_change(changeset, :password)
    password_confirmation = get_change(changeset, :password_confirmation)

    if password && !password_confirmation do
      add_error(changeset, :password_confirmation, "can't be blank")
    else
      changeset
    end
  end
end
