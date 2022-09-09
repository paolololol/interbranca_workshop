defmodule InterbrancaWeb.PageView do
  use InterbrancaWeb, :view
  import InterbrancaWeb.Utils

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
    if iscrizioni == nil do
      true
    else
      Enum.count(iscrizioni) < 2
    end
  end
end
