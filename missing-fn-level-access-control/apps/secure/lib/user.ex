defmodule Secure.User do
  @regular_user_changeset [:name, :email]
  @admin_changeset [:role]
  defstruct [:name, :email, :role]

  def create(params) do
    whitelisted_params = Map.take(params, @regular_user_changeset)

    struct(%__MODULE__{}, whitelisted_params)
  end

  def is_admin?(%__MODULE__{} = user) do
    Map.get(user, :is_admin)
  end

  def update_user_role(%__MODULE__{role: role} = _self_user, %__MODULE__{} = target_user) do
    case role do
      :admin -> {:ok, target_user}
      :regular -> {:error, "not allowed"}
      _ -> {:error, "not allowed"}
    end
  end

end
