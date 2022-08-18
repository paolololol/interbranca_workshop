defmodule InterbrancaWeb.WorkshopController do
  use InterbrancaWeb, :controller

  alias Interbranca.Workshops
  alias Interbranca.Workshops.Workshop

  def index(conn, _params) do
    workshops = Workshops.list_workshops()
    render(conn, "index.html", workshops: workshops)
  end

  def new(conn, _params) do
    changeset = Workshops.change_workshop(%Workshop{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"workshop" => workshop_params}) do
    case Workshops.create_workshop(workshop_params) do
      {:ok, workshop} ->
        conn
        |> put_flash(:info, "Workshop created successfully.")
        |> redirect(to: Routes.workshop_path(conn, :show, workshop))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    workshop = Workshops.get_workshop!(id)
    render(conn, "show.html", workshop: workshop)
  end

  def edit(conn, %{"id" => id}) do
    workshop = Workshops.get_workshop!(id)
    changeset = Workshops.change_workshop(workshop)
    render(conn, "edit.html", workshop: workshop, changeset: changeset)
  end

  def update(conn, %{"id" => id, "workshop" => workshop_params}) do
    workshop = Workshops.get_workshop!(id)

    case Workshops.update_workshop(workshop, workshop_params) do
      {:ok, workshop} ->
        conn
        |> put_flash(:info, "Workshop updated successfully.")
        |> redirect(to: Routes.workshop_path(conn, :show, workshop))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", workshop: workshop, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    workshop = Workshops.get_workshop!(id)
    {:ok, _workshop} = Workshops.delete_workshop(workshop)

    conn
    |> put_flash(:info, "Workshop deleted successfully.")
    |> redirect(to: Routes.workshop_path(conn, :index))
  end
end
