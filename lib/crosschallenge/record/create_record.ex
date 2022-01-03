defmodule Crosschallenge.Record.CreateRecord do
  import Ecto.Query, warn: false
  alias Crosschallenge.Repo
  alias Crosschallenge.Record

  def create_list(nums \\ %{}) do
    %Record{}
    |> Record.changeset(%{list: nums})
    |> Repo.insert()
  end
end
