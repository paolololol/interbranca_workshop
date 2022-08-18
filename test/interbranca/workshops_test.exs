defmodule Interbranca.WorkshopsTest do
  use Interbranca.DataCase

  alias Interbranca.Workshops

  describe "workshops" do
    alias Interbranca.Workshops.Workshop

    import Interbranca.WorkshopsFixtures

    @invalid_attrs %{begins: nil, description: nil, ends: nil, max_slots: nil, name: nil}

    test "list_workshops/0 returns all workshops" do
      workshop = workshop_fixture()
      assert Workshops.list_workshops() == [workshop]
    end

    test "get_workshop!/1 returns the workshop with given id" do
      workshop = workshop_fixture()
      assert Workshops.get_workshop!(workshop.id) == workshop
    end

    test "create_workshop/1 with valid data creates a workshop" do
      valid_attrs = %{begins: "some begins", description: "some description", ends: "some ends", max_slots: 42, name: "some name"}

      assert {:ok, %Workshop{} = workshop} = Workshops.create_workshop(valid_attrs)
      assert workshop.begins == "some begins"
      assert workshop.description == "some description"
      assert workshop.ends == "some ends"
      assert workshop.max_slots == 42
      assert workshop.name == "some name"
    end

    test "create_workshop/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Workshops.create_workshop(@invalid_attrs)
    end

    test "update_workshop/2 with valid data updates the workshop" do
      workshop = workshop_fixture()
      update_attrs = %{begins: "some updated begins", description: "some updated description", ends: "some updated ends", max_slots: 43, name: "some updated name"}

      assert {:ok, %Workshop{} = workshop} = Workshops.update_workshop(workshop, update_attrs)
      assert workshop.begins == "some updated begins"
      assert workshop.description == "some updated description"
      assert workshop.ends == "some updated ends"
      assert workshop.max_slots == 43
      assert workshop.name == "some updated name"
    end

    test "update_workshop/2 with invalid data returns error changeset" do
      workshop = workshop_fixture()
      assert {:error, %Ecto.Changeset{}} = Workshops.update_workshop(workshop, @invalid_attrs)
      assert workshop == Workshops.get_workshop!(workshop.id)
    end

    test "delete_workshop/1 deletes the workshop" do
      workshop = workshop_fixture()
      assert {:ok, %Workshop{}} = Workshops.delete_workshop(workshop)
      assert_raise Ecto.NoResultsError, fn -> Workshops.get_workshop!(workshop.id) end
    end

    test "change_workshop/1 returns a workshop changeset" do
      workshop = workshop_fixture()
      assert %Ecto.Changeset{} = Workshops.change_workshop(workshop)
    end
  end

  describe "iscrizioni" do
    alias Interbranca.Workshops.Iscrizione

    import Interbranca.WorkshopsFixtures

    @invalid_attrs %{name: nil, tessera: nil}

    test "list_iscrizioni/0 returns all iscrizioni" do
      iscrizione = iscrizione_fixture()
      assert Workshops.list_iscrizioni() == [iscrizione]
    end

    test "get_iscrizione!/1 returns the iscrizione with given id" do
      iscrizione = iscrizione_fixture()
      assert Workshops.get_iscrizione!(iscrizione.id) == iscrizione
    end

    test "create_iscrizione/1 with valid data creates a iscrizione" do
      valid_attrs = %{name: "some name", tessera: "some tessera"}

      assert {:ok, %Iscrizione{} = iscrizione} = Workshops.create_iscrizione(valid_attrs)
      assert iscrizione.name == "some name"
      assert iscrizione.tessera == "some tessera"
    end

    test "create_iscrizione/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Workshops.create_iscrizione(@invalid_attrs)
    end

    test "update_iscrizione/2 with valid data updates the iscrizione" do
      iscrizione = iscrizione_fixture()
      update_attrs = %{name: "some updated name", tessera: "some updated tessera"}

      assert {:ok, %Iscrizione{} = iscrizione} = Workshops.update_iscrizione(iscrizione, update_attrs)
      assert iscrizione.name == "some updated name"
      assert iscrizione.tessera == "some updated tessera"
    end

    test "update_iscrizione/2 with invalid data returns error changeset" do
      iscrizione = iscrizione_fixture()
      assert {:error, %Ecto.Changeset{}} = Workshops.update_iscrizione(iscrizione, @invalid_attrs)
      assert iscrizione == Workshops.get_iscrizione!(iscrizione.id)
    end

    test "delete_iscrizione/1 deletes the iscrizione" do
      iscrizione = iscrizione_fixture()
      assert {:ok, %Iscrizione{}} = Workshops.delete_iscrizione(iscrizione)
      assert_raise Ecto.NoResultsError, fn -> Workshops.get_iscrizione!(iscrizione.id) end
    end

    test "change_iscrizione/1 returns a iscrizione changeset" do
      iscrizione = iscrizione_fixture()
      assert %Ecto.Changeset{} = Workshops.change_iscrizione(iscrizione)
    end
  end
end
