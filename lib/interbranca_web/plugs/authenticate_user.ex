defmodule InterbrancaWeb.Plugs.AuthenticateUser do
  import Plug.Conn
  import Phoenix.Controller
  alias InterbrancaWeb.Router.Helpers

  def init(_params) do
  end

  def call(conn, _params) do
    if get_session(conn, :current_user) != nil do
      conn
    else
      conn
      |> redirect(to: "/auth")
      |> halt()
    end
  end
end
