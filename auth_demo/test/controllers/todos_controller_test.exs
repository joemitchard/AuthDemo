defmodule AuthDemo.TodoControllerTest do
  use AuthDemo.ConnCase

  alias AuthDemo.TodoView

  test "index renders a list of todos" do
    conn = build_conn()
    todo = insert(:todo)

    conn = get conn, todo_path(conn, :index)

    assert json_response(conn, 200) == render_json(TodoView, "index.json", todos: [todo])
  end

  test "show renders one todo" do
    conn = build_conn()
    todo = insert(:todo)

    conn = get conn, todo_path(conn, :show, todo)

    assert json_response(conn, 200) == render_json(TodoView, "show.json", todo: todo)
  end
end