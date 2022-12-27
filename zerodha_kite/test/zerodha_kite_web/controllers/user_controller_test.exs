defmodule ZerodhaKiteWeb.UserControllerTest do
  use ZerodhaKiteWeb.ConnCase

  import ZerodhaKite.AdminFixtures

  alias ZerodhaKite.Admin.User

  @create_attrs %{
    address: "some address",
    data_of_birth: ~D[2022-12-26],
    email: "some email",
    income_tax_return: 42,
    name: "some name",
    photograph: "some photograph",
    role: "some role",
    user_id: "some user_id"
  }
  @update_attrs %{
    address: "some updated address",
    data_of_birth: ~D[2022-12-27],
    email: "some updated email",
    income_tax_return: 43,
    name: "some updated name",
    photograph: "some updated photograph",
    role: "some updated role",
    user_id: "some updated user_id"
  }
  @invalid_attrs %{address: nil, data_of_birth: nil, email: nil, income_tax_return: nil, name: nil, photograph: nil, role: nil, user_id: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all users", %{conn: conn} do
      conn = get(conn, Routes.user_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create user" do
    test "renders user when data is valid", %{conn: conn} do
      conn = post(conn, Routes.user_path(conn, :create), user: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.user_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "address" => "some address",
               "data_of_birth" => "2022-12-26",
               "email" => "some email",
               "income_tax_return" => 42,
               "name" => "some name",
               "photograph" => "some photograph",
               "role" => "some role",
               "user_id" => "some user_id"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.user_path(conn, :create), user: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update user" do
    setup [:create_user]

    test "renders user when data is valid", %{conn: conn, user: %User{id: id} = user} do
      conn = put(conn, Routes.user_path(conn, :update, user), user: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.user_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "address" => "some updated address",
               "data_of_birth" => "2022-12-27",
               "email" => "some updated email",
               "income_tax_return" => 43,
               "name" => "some updated name",
               "photograph" => "some updated photograph",
               "role" => "some updated role",
               "user_id" => "some updated user_id"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, user: user} do
      conn = put(conn, Routes.user_path(conn, :update, user), user: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete user" do
    setup [:create_user]

    test "deletes chosen user", %{conn: conn, user: user} do
      conn = delete(conn, Routes.user_path(conn, :delete, user))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.user_path(conn, :show, user))
      end
    end
  end

  defp create_user(_) do
    user = user_fixture()
    %{user: user}
  end
end
