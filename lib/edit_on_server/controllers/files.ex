defmodule EditOnServer.Controllers.Files do
  use Phoenix.Controller
  use Jazz
  
  @files_path "."
  
  defp full_path(name) do
    @files_path <> "/" <> name
  end
  
  def index(conn, _params) do
    files = @files_path |> File.ls! |> Enum.filter &(File.regular?(full_path(&1)))
    json conn, JSON.encode!(files)
  end
  
  def show(conn, %{"id" => id}) do
    contents = id |> full_path |> File.read!
    text conn, contents
  end

  def update(conn, %{"id" => id, "content" => content} ) do
    case File.write!(id, content) do
        :ok -> 
            json(conn, JSON.encode!(%{success: true}))
        {:error, reason} -> 
            json(conn, JSON.encode!(%{success: false, error: reason}))
    end
  end

end
