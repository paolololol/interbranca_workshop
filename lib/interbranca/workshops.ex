defmodule Interbranca.Workshops do
  @moduledoc """
  The Workshops context.
  """

  import Ecto.Query, warn: false
  alias Interbranca.Repo

  alias Interbranca.Workshops.Workshop

  @doc """
  Returns the list of workshops.

  ## Examples

      iex> list_workshops()
      [%Workshop{}, ...]

  """
  def list_workshops do
    Repo.all(Workshop) |> Repo.preload(:iscrizioni)
  end

  @doc """
  Gets a single workshop.

  Raises `Ecto.NoResultsError` if the Workshop does not exist.

  ## Examples

      iex> get_workshop!(123)
      %Workshop{}

      iex> get_workshop!(456)
      ** (Ecto.NoResultsError)

  """
  def get_workshop!(id), do: Repo.get!(Workshop, id) |> Repo.preload(iscrizioni: [:persona])

  @doc """
  Creates a workshop.

  ## Examples

      iex> create_workshop(%{field: value})
      {:ok, %Workshop{}}

      iex> create_workshop(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_workshop(attrs \\ %{}) do
    %Workshop{}
    |> Workshop.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a workshop.

  ## Examples

      iex> update_workshop(workshop, %{field: new_value})
      {:ok, %Workshop{}}

      iex> update_workshop(workshop, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_workshop(%Workshop{} = workshop, attrs) do
    workshop
    |> Workshop.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a workshop.

  ## Examples

      iex> delete_workshop(workshop)
      {:ok, %Workshop{}}

      iex> delete_workshop(workshop)
      {:error, %Ecto.Changeset{}}

  """
  def delete_workshop(%Workshop{} = workshop) do
    Repo.delete(workshop)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking workshop changes.

  ## Examples

      iex> change_workshop(workshop)
      %Ecto.Changeset{data: %Workshop{}}

  """
  def change_workshop(%Workshop{} = workshop, attrs \\ %{}) do
    Workshop.changeset(workshop, attrs)
  end

  alias Interbranca.Workshops.Iscrizione

  @doc """
  Returns the list of iscrizioni.

  ## Examples

      iex> list_iscrizioni()
      [%Iscrizione{}, ...]

  """
  def list_iscrizioni do
    Repo.all(Iscrizione)
  end

  @doc """
  Returns the list of iscrizioni for a user.

  ## Examples

      iex> list_iscrizioni_by_user(1)
      [%Iscrizione{}, ...]

  """
  def list_iscrizioni_by_user(tessera) do
    from(i in Iscrizione, where: i.tessera == ^tessera)
    |> Repo.all
    |> Repo.preload(:workshop)
  end

  @doc """
  Gets a single iscrizione.

  Raises `Ecto.NoResultsError` if the Iscrizione does not exist.

  ## Examples

      iex> get_iscrizione!(123)
      %Iscrizione{}

      iex> get_iscrizione!(456)
      ** (Ecto.NoResultsError)

  """
  def get_iscrizione!(tessera, workshop), do: Repo.get_by!(Iscrizione, [tessera: tessera, workshop_id: workshop])

  @doc """
  Creates a iscrizione.

  ## Examples

      iex> create_iscrizione(%{field: value})
      {:ok, %Iscrizione{}}

      iex> create_iscrizione(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_iscrizione(attrs \\ %{}) do
    %Iscrizione{}
    |> Iscrizione.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a iscrizione.

  ## Examples

      iex> update_iscrizione(iscrizione, %{field: new_value})
      {:ok, %Iscrizione{}}

      iex> update_iscrizione(iscrizione, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_iscrizione(%Iscrizione{} = iscrizione, attrs) do
    iscrizione
    |> Iscrizione.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a iscrizione.

  ## Examples

      iex> delete_iscrizione(iscrizione)
      {:ok, %Iscrizione{}}

      iex> delete_iscrizione(iscrizione)
      {:error, %Ecto.Changeset{}}

  """
  def delete_iscrizione(%Iscrizione{} = iscrizione) do
    Repo.delete(iscrizione)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking iscrizione changes.

  ## Examples

      iex> change_iscrizione(iscrizione)
      %Ecto.Changeset{data: %Iscrizione{}}

  """
  def change_iscrizione(%Iscrizione{} = iscrizione, attrs \\ %{}) do
    Iscrizione.changeset(iscrizione, attrs)
  end
end
