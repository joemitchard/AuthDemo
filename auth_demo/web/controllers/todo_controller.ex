defmodule AuthDemo.TodoController do
  use AuthDemo.Web, :controller

  alias AuthDemo.Todo

  def index(conn, _params) do
    todos = Repo.all(Todo)
    render conn, "index.json", todos: todos
  end

  def show(conn, %{"id"=> id}) do
      todo = Repo.get!(Todo, id)
      render conn, "show.json", todo: todo
  end
end