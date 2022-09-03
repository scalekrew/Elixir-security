defmodule SecureTest do
  use ExUnit.Case
  doctest Secure
  alias Secure.User

  setup do
    content = [
      %{type: :free, id: 1, content: "lorel ipsum", author: 1},
      %{type: :free, id: 2, content: "lorel ipsum", author: 1},
      %{type: :free, id: 3, content: "lorel ipsum", author: 2},
      %{type: :free, id: 4, content: "lorel ipsum", author: 2},
      %{type: :paid, id: 5, content: "lorel ipsum", author: 2},

    ]
    users = [
      admin_sandesh: %User{
        name: "sandesh",
        role: :admin,
        id: 1,
        notes: ["Note 1", "Note 2", "Note 3"]
      },
      regular_david: %User{
        name: "David",
        role: :regular,
        id: 2,
        notes: ["Note 21", "Note 22", "Note 23"]
      },
      paid_nikita: %User{
        name: "Nikita",
        role: :paid,
        id: 3,
        notes: ["Note 31", "Note 32", "Note 33"]
      }
    ]

    {:ok, users: users}
  end

  test "greets the world" do
    assert Secure.hello() == :world
  end

  test "Regular user canot change membership", %{users: users} do
    self_user = users[:regular_david]
    target_user = users[:admin_sandesh]
    assert {:error, _} = Secure.User.update_user_role(self_user, target_user)
  end

  test "Admin user can change membership", %{users: users} do
    self_user = users[:admin_sandesh]
    target_user = users[:regular_david]
    assert {:ok, _} = Secure.User.update_user_role(self_user, target_user)
  end



  # test "ads", %{users: users} do
  #   # Secure.update_user_role(self, target_user) do
  #   end
  # end
end
