defmodule InterbrancaWeb.WorkshopControllerTest do
  use InterbrancaWeb.ConnCase

  import Interbranca.WorkshopsFixtures

  @create_attrs %{begins: "some begins", description: "some description", ends: "some ends", max_slots: 42, name: "some name"}
  @update_attrs %{begins: "some updated begins", description: "some updated description", ends: "some updated ends", max_slots: 43, name: "some updated name"}
  @invalid_attrs %{begins: nil, description: nil, ends: nil, max_slots: nil, name: nil}

  describe "index" do
    test "lists all workshops", %{conn: conn} do
      conn = get(conn, Routes.workshop_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Workshops"
    end
  end

  describe "new workshop" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.workshop_path(conn, :new))
      assert html_response(conn, 200) =~ "New Workshop"
    end
  end

  describe "create workshop" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.workshop_path(conn, :create), workshop: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.workshop_path(conn, :show, id)

      conn = get(conn, Routes.workshop_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Workshop"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.workshop_path(conn, :create), workshop: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Workshop"
    end
  end

  describe "edit workshop" do
    setup [:create_workshop]

    test "renders form for editing chosen workshop", %{conn: conn, workshop: workshop} do
      conn = get(conn, Routes.workshop_path(conn, :edit, workshop))
      assert html_response(conn, 200) =~ "Edit Workshop"
    end
  end

  describe "update workshop" do
    setup [:create_workshop]

    test "redirects when data is valid", %{conn: conn, workshop: workshop} do
      conn = put(conn, Routes.workshop_path(conn, :update, workshop), workshop: @update_attrs)
      assert redirected_to(conn) == Routes.workshop_path(conn, :show, workshop)

      conn = get(conn, Routes.workshop_path(conn, :show, workshop))
      assert html_response(conn, 200) =~ "some updated begins"
    end

    test "renders errors when data is invalid", %{conn: conn, workshop: workshop} do
      conn = put(conn, Routes.workshop_path(conn, :update, workshop), workshop: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Workshop"
    end
  end

  describe "delete workshop" do
    setup [:create_workshop]

    test "deletes chosen workshop", %{conn: conn, workshop: workshop} do
      conn = delete(conn, Routes.workshop_path(conn, :delete, workshop))
      assert redirected_to(conn) == Routes.workshop_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.workshop_path(conn, :show, workshop))
      end
    end
  end

  defp create_workshop(_) do
    workshop = workshop_fixture()
    %{workshop: workshop}
  end
end
