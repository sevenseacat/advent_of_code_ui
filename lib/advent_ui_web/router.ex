defmodule AdventUIWeb.Router do
  use AdventUIWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {AdventUIWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", AdventUIWeb do
    pipe_through :browser

    live "/", HomeLive
    live "/:year", YearLive
    live "/:year/:day", DayLive
  end
end
