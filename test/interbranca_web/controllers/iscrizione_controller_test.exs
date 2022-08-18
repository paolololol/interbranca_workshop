defmodule InterbrancaWeb.IscrizioneControllerTest do
  use InterbrancaWeb.ConnCase

  import Interbranca.WorkshopsFixtures

  @create_attrs %{name: "some name", tessera: "some tessera"}
  @update_attrs %{name: "some updated name", tessera: "some updated tessera"}
  @invalid_attrs %{name: nil, tessera: nil}

  describe "index" do
    test "lists all iscrizioni", %{conn: conn} do
      conn = get(conn, Routes.iscrizione_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Iscrizioni"
    end
  end

  describe "new iscrizione" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.iscrizione_path(conn, :new))
      assert html_response(conn, 200) =~ "New Iscrizione"
    end
  end

  describe "create iscrizione" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.iscrizione_path(conn, :create), iscrizione: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.iscrizione_path(conn, :show, id)

      conn = get(conn, Routes.iscrizione_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Iscrizione"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.iscrizione_path(conn, :create), iscrizione: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Iscrizione"
    end
  end

  describe "edit iscrizione" do
    setup [:create_iscrizione]

    test "renders form for editing chosen iscrizione", %{conn: conn, iscrizione: iscrizione} do
      conn = get(conn, Routes.iscrizione_path(conn, :edit, iscrizione))
      assert html_response(conn, 200) =~ "Edit Iscrizione"
    end
  end

  describe "update iscrizione" do
    setup [:create_iscrizione]

    test "redirects when data is valid", %{conn: conn, iscrizione: iscrizione} do
      conn = put(conn, Routes.iscrizione_path(conn, :update, iscrizione), iscrizione: @update_attrs)
      assert redirected_to(conn) == Routes.iscrizione_path(conn, :show, iscrizione)

      conn = get(conn, Routes.iscrizione_path(conn, :show, iscrizione))
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, iscrizione: iscrizione} do
      conn = put(conn, Routes.iscrizione_path(conn, :update, iscrizione), iscrizione: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Iscrizione"
    end
  end

  describe "delete iscrizione" do
    setup [:create_iscrizione]

    test "deletes chosen iscrizione", %{conn: conn, iscrizione: iscrizione} do
      conn = delete(conn, Routes.iscrizione_path(conn, :delete, iscrizione))
      assert redirected_to(conn) == Routes.iscrizione_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.iscrizione_path(conn, :show, iscrizione))
      end
    end
  end

  defp create_iscrizione(_) do
    iscrizione = iscrizione_fixture()
    %{iscrizione: iscrizione}
  end
end
