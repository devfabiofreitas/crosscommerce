defmodule CrosschallengeWeb.Router do
  use CrosschallengeWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", CrosschallengeWeb do
    pipe_through :api

    get "/numbers", NumbersController, :index
    get "/show", ShowController, :resq
  end

  # Other scopes may use custom stacks.
  # scope "/api", CrosschallengeWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :api

      live_dashboard "/dashboard", metrics: CrosschallengeWeb.Telemetry
    end
  end
end
