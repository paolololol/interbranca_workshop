defmodule InterbrancaWeb.PageView do
  use InterbrancaWeb, :view
  import InterbrancaWeb.Utils

  def is_iscritto?(conn, workshop_id) do
    iscrizioni = Interbranca.Workshops.list_iscrizioni_by_user(get_tessera_from_session(conn))
    if iscrizioni == nil do
      false
    else
      iscrizioni
        |> Enum.map(fn x -> x.workshop_id end)
        |> Enum.member?(workshop_id)
    end
  end

  def can_signup?(conn) do
    iscrizioni = Interbranca.Workshops.list_iscrizioni_by_user(get_tessera_from_session(conn))
    if iscrizioni == nil do
      true
    else
      Enum.count(iscrizioni) < 2
    end
  end
end
