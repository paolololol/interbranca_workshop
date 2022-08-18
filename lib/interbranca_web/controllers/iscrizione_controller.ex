defmodule InterbrancaWeb.IscrizioneController do
  use InterbrancaWeb, :controller

  alias Interbranca.Workshops
  alias Interbranca.Workshops.Iscrizione
  import InterbrancaWeb.Utils

  def index(conn, _params) do
    iscrizioni = Workshops.list_iscrizioni()
    render(conn, "index.html", iscrizioni: iscrizioni)
  end

  def create(conn, %{"iscrizione" => iscrizione_params}) do
    session = get_session(conn, :current_user)
    full_iscrizione = iscrizione_params
      |> Map.put("name", session["name"])
      |> Map.put("tessera", session["preferred_username"])
    IO.inspect(full_iscrizione)
    case Workshops.create_iscrizione(full_iscrizione) do
      {:ok, iscrizione} ->
        conn
        |> put_flash(:info, "Iscrizione completata con successo!")
        |> redirect(to: "/")

      {:error, %Ecto.Changeset{} = changeset} ->
        IO.inspect(changeset)
        conn
        |> put_flash(:error, "Si è verificato un errore!")
        |> redirect(to: "/")
    end
  end

  def delete(conn, %{"id" => id}) do
    iscrizione = Workshops.get_iscrizione!(get_tessera_from_session(conn), id)
    {:ok, _iscrizione} = Workshops.delete_iscrizione(iscrizione)

    conn
    |> put_flash(:info, "Iscrizione annullata")
    |> redirect(to: "/")
  end
end
