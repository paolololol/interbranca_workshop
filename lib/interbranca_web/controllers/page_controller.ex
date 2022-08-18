defmodule InterbrancaWeb.PageController do
  use InterbrancaWeb, :controller

  def index(conn, _params) do
    workshops = Interbranca.Workshops.list_workshops()
    render(conn, "index.html", workshops: workshops)
  end
end
