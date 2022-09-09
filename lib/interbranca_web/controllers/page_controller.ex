defmodule InterbrancaWeb.PageController do
  use InterbrancaWeb, :controller
  import InterbrancaWeb.Utils

  def index(conn, _params) do
    iscrizioni = Interbranca.Workshops.list_iscrizioni_by_user(get_tessera_from_session(conn))
    workshops = Interbranca.Workshops.list_workshops()
     |> Enum.sort_by(&(&1.id))
     |> Enum.sort_by(&(&1.hub))
    render(conn, "index.html", workshops: workshops, iscrizioni: iscrizioni)
  end
end
