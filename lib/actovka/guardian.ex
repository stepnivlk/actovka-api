defmodule Actovka.Guardian do
  use Guardian, otp_app: :actovka

  alias Actovka.Accounts

  def subject_for_token(resource, _claims) do
    {:ok, to_string(resource.id)}
  end

  def subject_for_token(_, _) do
    {:error, :reason_for_error}
  end

  def resource_from_claims(claims) do
    {:ok, Accounts.get_user!(claims["sub"])}
  end
  def resource_from_claims(_claims) do
    {:error, :reason_for_error}
  end
end
