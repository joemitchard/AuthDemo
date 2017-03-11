defmodule AuthDemo.JsonHelpers do
    @moduledoc """
    A module to provide helper functions for json returns
    """

    @doc """
    takes an Ecto changeset and returns a valid json list
    """
    def errors_json(changeset) do
        Ecto.Changeset.traverse_errors(changeset, fn
            {msg, opts} -> 
                String.replace(msg, "%{count}", to_string(opts[:count]))
            msg -> 
                msg
        end)
    end
end