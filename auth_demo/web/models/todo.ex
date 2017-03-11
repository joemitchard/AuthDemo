defmodule AuthDemo.Todo do
  use AuthDemo.Web, :model

  @timestamps_opts [usec: false]
  schema "todos" do
    field :title
    field :description

    timestamps
  end

  def changeset(model, params \\ %{}) do
      model
      |> cast(params, [:title, :description])
      |> validate_required([:title])
      |> validate_length(:title, min: 1, max: 20)
  end

end