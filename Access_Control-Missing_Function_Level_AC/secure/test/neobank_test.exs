defmodule NeobankTest do
  use ExUnit.Case
  doctest Neobank

  setup do
    {:ok,
     regular_params: %{
       first_name: "Sandesh",
       last_name: "Soni",
       password: "123abc124",
       email: "hello@sandeshsoni.com"
     },
     vulnerable_params: %{
       is_admin: true,
       first_name: "Sandesh",
       last_name: "Soni",
       password: "123abc124",
       email: "hello@sandeshsoni.com"
     }}
  end


  # Access Control - Insecure Direct Object Reference
  describe "access control - Missing Function Level Access Control" do
    test "is_admin extra param doesnt reflect for correct params", %{regular_params: params} do
      user = Neobank.create_user(params)
      assert Neobank.is_user_admin?(user) == false

      assert Map.get(user, :first_name) == "Sandesh"
      assert Map.get(user, :last_name) == "Soni"
      refute Map.get(user, :first_name) == "Wrong"
      refute Map.get(user, :last_name) == "Name"
    end

    test "is_admin extra param doesnt reflect for vulnerable params params", %{
      vulnerable_params: params
    } do
      user = Neobank.create_user(params)
      assert Neobank.is_user_admin?(user) == false

      assert Map.get(user, :first_name) == "Sandesh"
      assert Map.get(user, :last_name) == "Soni"
      refute Map.get(user, :first_name) == "Wrong"
      refute Map.get(user, :last_name) == "Name"
    end
  end
end
