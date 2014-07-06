defmodule EditOnServer.Router do
  use Phoenix.Router

  plug Plug.Static, at: "/static", from: :edit_on_server
  get "/", EditOnServer.Controllers.Pages, :index, as: :page
  resources "files", EditOnServer.Controllers.Files 
end
