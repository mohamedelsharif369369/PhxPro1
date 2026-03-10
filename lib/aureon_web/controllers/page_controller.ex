defmodule AureonWeb.PageController do
  use AureonWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
