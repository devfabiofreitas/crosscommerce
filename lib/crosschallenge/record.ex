defmodule Crosschallenge.Record do
  use Ecto.Schema
  import Ecto.Changeset

  schema "list" do
    field :list, {:array, :float}
    timestamps()
  end

  def changeset(list, attrs) do
    list
    |> cast(attrs, [:list])
    |> validate_required([:list])
  end
end
