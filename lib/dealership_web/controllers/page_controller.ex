defmodule DealershipWeb.PageController do
  use DealershipWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
