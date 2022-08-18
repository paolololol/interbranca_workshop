defmodule InterbrancaWeb.AuthController do
  use InterbrancaWeb, :controller

  plug Ueberauth

  def callback(%{assigns: %{ueberauth_failure: _fails}} = conn, _params) do
    conn
    |> put_flash(:error, "Failed to authenticate.")
    |> redirect(to: "/")
  end

  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, _params) do
    conn
        |> put_session(:current_user, auth.extra.raw_info.user)
        |> configure_session(renew: true)
        |> redirect(to: "/")
    end

    def logout(conn, _params) do
      encoded_uri = URI.encode_www_form("https://interbranca.cngei.it")
      conn
        |> delete_session(:current_user)
        |> redirect(external: "https://auth.cngei.it/auth/realms/cngei/protocol/openid-connect/logout?redirect_uri=#{encoded_uri}")
    end
end
