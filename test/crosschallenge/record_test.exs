defmodule Crosschallenge.RecordTest do
  use Crosschallenge.DataCase, async: true
  alias Ecto.Changeset
  alias Crosschallenge.Record

  describe "changeset/2" do
    test "returns a valid changeset" do
      response = Record.changeset(%Record{}, %{list: 1.75})

      assert %Changeset{} = response
    end
  end
end
