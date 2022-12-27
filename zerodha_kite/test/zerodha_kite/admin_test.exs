defmodule ZerodhaKite.AdminTest do
  use ZerodhaKite.DataCase

  alias ZerodhaKite.Admin

  describe "users" do
    alias ZerodhaKite.Admin.User

    import ZerodhaKite.AdminFixtures

    @invalid_attrs %{address: nil, data_of_birth: nil, email: nil, income_tax_return: nil, name: nil, photograph: nil, role: nil, user_id: nil}

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Admin.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Admin.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{address: "some address", data_of_birth: ~D[2022-12-26], email: "some email", income_tax_return: 42, name: "some name", photograph: "some photograph", role: "some role", user_id: "some user_id"}

      assert {:ok, %User{} = user} = Admin.create_user(valid_attrs)
      assert user.address == "some address"
      assert user.data_of_birth == ~D[2022-12-26]
      assert user.email == "some email"
      assert user.income_tax_return == 42
      assert user.name == "some name"
      assert user.photograph == "some photograph"
      assert user.role == "some role"
      assert user.user_id == "some user_id"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Admin.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      update_attrs = %{address: "some updated address", data_of_birth: ~D[2022-12-27], email: "some updated email", income_tax_return: 43, name: "some updated name", photograph: "some updated photograph", role: "some updated role", user_id: "some updated user_id"}

      assert {:ok, %User{} = user} = Admin.update_user(user, update_attrs)
      assert user.address == "some updated address"
      assert user.data_of_birth == ~D[2022-12-27]
      assert user.email == "some updated email"
      assert user.income_tax_return == 43
      assert user.name == "some updated name"
      assert user.photograph == "some updated photograph"
      assert user.role == "some updated role"
      assert user.user_id == "some updated user_id"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Admin.update_user(user, @invalid_attrs)
      assert user == Admin.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Admin.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Admin.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Admin.change_user(user)
    end
  end
end
