defmodule Interbranca.Alloggi do
  @moduledoc """
  The Workshops context.
  """

  import Ecto.Query, warn: false
  alias Interbranca.Repo

  alias Interbranca.Alloggi.Camera

  def get_camera_by_tessera(tessera) do
    own_camera = from(c in Camera, where: c.tessera == ^tessera)
      |> Repo.all
    cond do
      Enum.empty?(own_camera) -> own_camera
      Enum.at(own_camera,0).tipologia == "Tenda" -> own_camera
      true ->
        camera = Enum.at(own_camera, 0)
        from(c in Camera, where: c.struttura == ^camera.struttura and c.camera == ^camera.camera)
        |> Repo.all
    end
  end

end
