defmodule EditOnServer.Controllers.Pages do
  use Phoenix.Controller

  def index(conn, _params) do
    render conn, "index", within: nil
  end
end
