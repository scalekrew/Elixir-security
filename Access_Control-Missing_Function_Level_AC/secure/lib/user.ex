defmodule Neobank.User do

  @whitelisted_params [:first_name, :last_name, :email]
  defstruct [:first_name, :last_name, :email, is_admin: false]

  def create(params) do
    whitelisted_params = Map.take(params, @whitelisted_params)

    struct(%__MODULE__{}, whitelisted_params)
  end

  def is_admin?(%__MODULE__{} = user) do
    Map.get(user, :is_admin)
  end

end
