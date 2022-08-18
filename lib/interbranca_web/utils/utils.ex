defmodule InterbrancaWeb.Utils do
  import Plug.Conn

  def get_tessera_from_session(conn) do
    session = get_session(conn, :current_user)
    session["preferred_username"]
  end
end
