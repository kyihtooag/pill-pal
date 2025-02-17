defmodule PillPalWeb.Router do
  use PillPalWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {PillPalWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :ensure_auth do
    plug :fetch_session
    plug PillPalWeb.Plug.EnsureLogin
  end

  scope "/", PillPalWeb do
    pipe_through [:browser, :ensure_auth]

    get "/logout", AuthController, :logout

    live_session :default, on_mount: PillPalWeb.Plug.AssignsDefaults do
      live "/", LandingLive, :landing
      live "/dosage", DosageLive.Index, :index
      live "/dosage/dosing_periods", DosageLive.Index, :dosing_periods
      live "/dosage/medication/new", DosageLive.Index, :medication_new
      live "/insights", InsightsLive, :insights
    end
  end

  scope "/", PillPalWeb do
    pipe_through :browser

    get "/login", AuthController, :login
    get "/auth/:provider", AuthController, :request
    get "/auth/:provider/callback", AuthController, :callback
  end

  # Other scopes may use custom stacks.
  # scope "/api", PillPalWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard in development
  if Application.compile_env(:pill_pal, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: PillPalWeb.Telemetry
    end
  end
end
