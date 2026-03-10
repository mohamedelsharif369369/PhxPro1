defmodule AureonWeb.UserLive.Index do
  use AureonWeb, :live_view

  alias Aureon.Accounts
  alias Aureon.Accounts.User

  def mount(_params, _session, socket) do
    {:ok, assign(socket, users: Accounts.list_users())}
  end

  def render(assigns) do
    ~H"""
    <h1>Users</h1>
    <ul>
      <%= for user <- @users do %>
        <li><%= user.name %> - <%= user.email %></li>
      <% end %>
    </ul>
    """
  end
end
