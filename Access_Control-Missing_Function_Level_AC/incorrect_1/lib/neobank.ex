defmodule Neobank do
  @moduledoc """
  Documentation for `Neobank`.
  """

  defdelegate create_user(params), to: Neobank.User, as: :create
  defdelegate is_user_admin?(user), to: Neobank.User, as: :is_admin?

end
