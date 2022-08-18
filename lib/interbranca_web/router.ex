defmodule InterbrancaWeb.Router do
  use InterbrancaWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {InterbrancaWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :secure do
    plug InterbrancaWeb.Plugs.AuthenticateUser
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", InterbrancaWeb do
    pipe_through :browser
    pipe_through :secure

    get "/", PageController, :index
    resources "/workshops", WorkshopController
    resources "/iscrizioni", IscrizioneController
  end

  scope "/auth", InterbrancaWeb do
    pipe_through :browser

    get "/", AuthController, :request
    get "/logout", AuthController, :logout
    get "/callback", AuthController, :callback
  end
end
