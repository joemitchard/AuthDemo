defmodule AuthDemo.Router do
  use AuthDemo.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", AuthDemo do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/api", AuthDemo do
    pipe_through :api

    resources "/todos", TodoController, only: [:index, :show, :create]
  end
end
