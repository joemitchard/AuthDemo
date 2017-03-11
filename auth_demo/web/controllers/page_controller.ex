defmodule AuthDemo.PageController do
  use AuthDemo.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
