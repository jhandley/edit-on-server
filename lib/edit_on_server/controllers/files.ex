defmodule EditOnServer.Controllers.Files do
  use Phoenix.Controller
  use Jazz
  
  @files_path "."
  
  defp full_path(name) do
    @files_path <> "/" <> name
  end
  
  def index(conn, _params) do
    case @files_path |> File.ls do
        {:ok, files} ->
            json conn, JSON.encode!(%{success: true, files: Enum.filter(files, &(File.regular?(full_path(&1))))})
        {:error, reason} -> 
            json(conn, JSON.encode!(%{success: false, error: inspect(reason)}))
    end
  end
  
  def show(conn, %{"id" => id}) do
    case id |> full_path |> File.read do
        {:ok, contents} ->
            json(conn, JSON.encode!(%{success: true, contents: contents}))
        {:error, reason} -> 
            json(conn, JSON.encode!(%{success: false, error: inspect(reason)}))
    end
  end

  def update(conn, %{"id" => id, "content" => content} ) do
    case File.write(id, content) do
        :ok -> 
            json(conn, JSON.encode!(%{success: true}))
        {:error, reason} -> 
            json(conn, JSON.encode!(%{success: false, error: inspect(reason)}))
    end
  end

end
