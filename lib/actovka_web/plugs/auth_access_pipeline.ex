defmodule ActovkaWeb.Plugs.AuthAccessPipeline do
  use Guardian.Plug.Pipeline, otp_app: :actovka

  plug Guardian.Plug.VerifyHeader, claims: %{"typ" => "access"}
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource, ensure: true
end
