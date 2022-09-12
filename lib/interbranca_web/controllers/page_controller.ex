defmodule InterbrancaWeb.PageController do
  use InterbrancaWeb, :controller
  import InterbrancaWeb.Utils

  def index(conn, _params) do
    tessera = get_tessera_from_session(conn)
    iscrizioni = Interbranca.Workshops.list_iscrizioni_by_user(tessera)
    camere = Interbranca.Alloggi.get_camera_by_tessera(tessera)
    IO.inspect(camere)

    workshops = Interbranca.Workshops.list_workshops()
     |> Enum.sort_by(&(&1.id))
     |> Enum.sort_by(&(&1.hub))
    render(conn, "index.html", workshops: workshops, iscrizioni: iscrizioni, camere: camere)
  end
end
