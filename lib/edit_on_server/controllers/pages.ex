defmodule EditOnServer.Controllers.Pages do
  use Phoenix.Controller

  def index(conn, _params) do
    redirect conn, "/static/index.html"
  end
end
