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

  def create(conn, params) do
      # plug passes the body of the request as the params arg

    changeset = Todo.changeset(%Todo{}, params)

    case Repo.insert(changeset) do
        {:ok, todo} ->
            render(conn, "create.json", todo: todo)
        {:error, changeset} ->
            render(conn, "error.json", changeset: changeset)
    end
  end
end