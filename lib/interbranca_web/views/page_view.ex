defmodule InterbrancaWeb.PageView do
  use InterbrancaWeb, :view
  import InterbrancaWeb.Utils

  def is_partecipante?(camere) do
    !Enum.empty?(camere)
  end

  def format_camera(camere) do
    if(Enum.empty?(camere)) do nil end
    camera = Enum.at(camere, 0)
    cond do
      camera.tipologia == "Tenda" -> "Alloggerai in tenda"
      Enum.count(camere) == 1 -> "Alloggerai presso la struttura #{camera.struttura}, stanza #{camera.camera}"
      true ->
        "Alloggerai presso la struttura #{camera.struttura} nella stanza #{camera.camera} assieme a: #{Enum.map(camere, fn x -> x.nome end) |> Enum.join(", ")}"
    end
  end

  def is_iscritto?(conn, workshop_id, iscrizioni) do
    if iscrizioni == nil do
      false
    else
      iscrizioni
        |> Enum.map(fn x -> x.workshop_id end)
        |> Enum.member?(workshop_id)
    end
  end

  def slot_preso?(conn, workshop, iscrizioni) do
    if iscrizioni == nil do
      false
    else
      iscrizioni
      |> Enum.filter(fn x -> x.workshop.begins == workshop.begins end)
      |> Enum.empty?
    end
  end

  def can_signup?(conn, iscrizioni) do
    cond do
      expired?() -> false
      iscrizioni == nil -> true
      true -> Enum.count(iscrizioni) < 2
    end
  end

  def get_color(text) do
    cond do
     text == "Gioca il gioco" -> "#ff03ff"
     text == "ComExpress" -> "#45818e"
     text == "StarBene" -> "#ff9f11"
     text == "Scientificamente scout" -> "#980000"
    end
  end

  def expired?() do
    DateTime.compare(
      DateTime.utc_now(),
      DateTime.from_iso8601("2022-09-16T18:00:00Z") |> elem(1)
    ) == :gt
  end
end
