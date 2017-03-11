defmodule AuthDemo.TodoView do
  use AuthDemo.Web, :view

  def render("index.json", %{todos: todos}) do
    %{
      todos: Enum.map(todos, fn(todo) -> todo_json(todo) end)
    }
  end

  def render("show.json", %{todo: todo}) do
      %{todo: todo_json(todo)}
  end

  def render("create.json", %{todo: todo}) do
      %{
          status: :OK,
          title: todo.title
      }
  end

  def render("error.json", %{changeset: changeset}) do
      %{
          status: :NOTOK,
          errors: errors_json(changeset)
      }
  end

  def todo_json(todo) do
    %{
      title: todo.title,
      description: todo.description,
      inserted_at: todo.inserted_at,
      updated_at: todo.updated_at
    }
  end

end