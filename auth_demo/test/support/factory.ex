defmodule AuthDemo.Factory do
  use ExMachina.Ecto, repo: AuthDemo.Repo

  def todo_factory do
    %AuthDemo.Todo{
      title: "Something I need to do",
      description: "List of steps I need to complete"
    }
  end
end