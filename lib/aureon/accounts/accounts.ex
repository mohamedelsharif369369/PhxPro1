defmodule Aureon.Accounts do
  alias Aureon.Repo
  alias Aureon.Accounts.User

  def list_users do
    Repo.all(User)
  end
end
