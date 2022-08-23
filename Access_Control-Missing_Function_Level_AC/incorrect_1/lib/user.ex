defmodule Neobank.User do

  defstruct [:first_name, :last_name, :email, is_admin: false]

  def create(params) do
    struct(%__MODULE__{}, params)
  end

  def is_admin?(%__MODULE__{} = user) do
    Map.get(user, :is_admin)
  end

end
