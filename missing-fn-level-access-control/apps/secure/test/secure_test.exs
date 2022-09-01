defmodule SecureTest do
  use ExUnit.Case
  doctest Secure
  alias Secure.User

  setup do
    users = [
      admin_member: %User{name: "sandesh", role: :admin},
      regular_member: %User{name: "David", role: :regular},
      nikita: %User{name: "Nikita", role: :paid}
    ]
    {:ok, users: users}
  end

  test "greets the world" do
    assert Secure.hello() == :world
  end

  test "Regular user canot change membership", %{users: users} do
    admin_member = users[:admin_member]
    regular_member = users[:regular_member]
    assert {:error, _} = Secure.User.update_user_role(regular_member, admin_member)
  end

  test "Admin user can change membership", %{users: users} do
    admin_member = users[:admin_member]
    regular_member = users[:regular_member]
    assert {:ok, _} = Secure.User.update_user_role(admin_member, regular_member)
  end

  # test "ads", %{users: users} do
  #   # Secure.update_user_role(self, target_user) do
  #   end
  # end

end
