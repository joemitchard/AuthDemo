defmodule AuthDemo.Todo do
  use AuthDemo.Web, :model

  @timestamps_opts [usec: false]
  schema "todos" do
    field :title
    field :description

    timestamps
  end
end