defmodule ZerodhaKiteWeb.UserView do
  use ZerodhaKiteWeb, :view
  alias ZerodhaKiteWeb.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{
      id: user.id,
      name: user.name,
      email: user.email,
      role: user.role,
      address: user.address,
      income_tax_return: user.income_tax_return,
      photograph: user.photograph,
      data_of_birth: user.data_of_birth,
      user_id: user.user_id
    }
  end
end
