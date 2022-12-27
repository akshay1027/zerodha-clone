defmodule ZerodhaKite.AdminFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ZerodhaKite.Admin` context.
  """

  @doc """
  Generate a unique user email.
  """
  def unique_user_email, do: "some email#{System.unique_integer([:positive])}"

  @doc """
  Generate a unique user user_id.
  """
  def unique_user_user_id, do: "some user_id#{System.unique_integer([:positive])}"

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        address: "some address",
        data_of_birth: ~D[2022-12-26],
        email: unique_user_email(),
        income_tax_return: 42,
        name: "some name",
        photograph: "some photograph",
        role: "some role",
        user_id: unique_user_user_id()
      })
      |> ZerodhaKite.Admin.create_user()

    user
  end
end
