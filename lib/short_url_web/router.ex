defmodule ShortUrlWeb.Router do
  use ShortUrlWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ShortUrlWeb do
    pipe_through :api
    resources "/links", LinkController, except: [:edit]
  end

  scope "/", ShortUrlWeb do
    get "/:id", LinkController, :get_and_redirect
  end

end
