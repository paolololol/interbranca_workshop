defmodule Interbranca.WorkshopsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Interbranca.Workshops` context.
  """

  @doc """
  Generate a workshop.
  """
  def workshop_fixture(attrs \\ %{}) do
    {:ok, workshop} =
      attrs
      |> Enum.into(%{
        begins: "some begins",
        description: "some description",
        ends: "some ends",
        max_slots: 42,
        name: "some name"
      })
      |> Interbranca.Workshops.create_workshop()

    workshop
  end

  @doc """
  Generate a iscrizione.
  """
  def iscrizione_fixture(attrs \\ %{}) do
    {:ok, iscrizione} =
      attrs
      |> Enum.into(%{
        name: "some name",
        tessera: "some tessera"
      })
      |> Interbranca.Workshops.create_iscrizione()

    iscrizione
  end
end
